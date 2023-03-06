import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../state/app_state.dart';
import 'app_version_builder.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
    required this.body,
    this.showMenu = true,
    this.showBottomBar = true,
    this.showBack = true,
    this.scrolling = true,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: const ValueKey('BaseScaffold'));
  final Widget body;
  final bool showMenu;
  final bool showBottomBar;
  final bool showBack;
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
    final random = Random();

    return VisibilityDetector(
      key: ValueKey(random.nextInt(32767)),
      onVisibilityChanged: (info) {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          Widget wrappedBody = Padding(padding: widget.padding, child: widget.body);

          final isTestMode = context.select<AppState, bool>((e) => e.isTestMode);

          if (isTestMode) {
            wrappedBody = Stack(
              children: [
                wrappedBody,
                Positioned(
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
                ),
              ],
            );
          }

          return Scaffold(
            body: wrappedBody,
            extendBody: true,
          );
        },
      ),
    );
  }
}
