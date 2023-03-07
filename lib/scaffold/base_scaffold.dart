import 'package:flutter/material.dart';
import 'package:flutter_base/state/user_state.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../state/app_state.dart';
import 'app_version_builder.dart';

class BaseScaffold extends StatefulWidget with GetItStatefulWidgetMixin {
  BaseScaffold({
    required this.body,
    this.showBottomBar = true,
    this.showAppBar = true,
    this.scrolling = true,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: const ValueKey('BaseScaffold'));
  final Widget body;
  final bool showBottomBar;
  final bool showAppBar;
  final bool scrolling;
  final EdgeInsets padding;

  @override
  State<BaseScaffold> createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> with GetItStateMixin {
  Future<void> Function(BuildContext context) onBackTap = (context) async {
    final goRouter = GoRouter.of(context);
    try {
      if (goRouter.location != '/') goRouter.pop();
    } catch (_) {
      goRouter.go('/');
    }
  };

  @override
  Widget build(BuildContext context) {
    Widget body = Padding(padding: widget.padding, child: widget.body);
    final isTestMode = watchX<AppState, bool>((e) => e.isTestMode);
    if (isTestMode) {
      body = Stack(alignment: Alignment.center, children: [body, const _TestOverlay()]);
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        if (widget.showAppBar)
          SliverAppBar(
            actions: [
              if (watchX<UserState, bool>((e) => e.isLoggedIn)) IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)) else ElevatedButton(onPressed: () {}, child: const Text('LOGIN')),
            ],
          ),
        SliverToBoxAdapter(child: body),
      ]),
      extendBody: true,
      // appBar: widget.showAppBar
      //     ? AppBar(

      //         actions: [ElevatedButton(onPressed: () {}, child: const Text('LOGIN'))],
      //       )
      //     : null,
      // drawer: const Drawer(),
      bottomNavigationBar: widget.showBottomBar
          ? BottomNavigationBar(items: const [
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Item 1'),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Item 2'),
            ])
          : null,
    );
  }
}

class _TestOverlay extends StatelessWidget {
  const _TestOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 16,
        right: 16,
        child: IgnorePointer(child: Builder(builder: (context) {
          final style = Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(.5), fontSize: 16);
          return ColoredBox(
              color: Colors.white30,
              child: Column(children: [
                Row(children: [
                  AppVersionBuilder(builder: (_, version) => Text(' V$version', style: style)),
                ])
              ]));
        })));
  }
}
