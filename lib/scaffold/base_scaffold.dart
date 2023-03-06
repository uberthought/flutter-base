import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import 'app_version_builder.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
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

class BaseScaffoldState extends State<BaseScaffold> {
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
    Widget body = SizedBox.expand(child: Padding(padding: widget.padding, child: widget.body));

    final isTestMode = context.select<AppState, bool>((e) => e.isTestMode.value);

    if (isTestMode) {
      body = Stack(children: [body, const _TestOverlay()]);
    }

    return Scaffold(
      body: body,
      extendBody: true,
      appBar: widget.showAppBar ? AppBar() : null,
      endDrawer: const Drawer(),
      bottomNavigationBar: widget.showBottomBar
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Item 1'),
                BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Item 2'),
              ],
            )
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
      child: IgnorePointer(
        child: Builder(builder: (context) {
          final style = Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(.5), fontSize: 16);
          return ColoredBox(
            color: Colors.white30,
            child: Column(
              children: [
                Row(
                  children: [
                    AppVersionBuilder(builder: (_, version) => Text(' V$version', style: style)),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
