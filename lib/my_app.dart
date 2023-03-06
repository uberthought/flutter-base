import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'go_router.dart';
import 'state/app_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _initalize = Future(() async {
    await AppState.initialize();
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
      future: _initalize,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return Image.asset('assets/splash.png', fit: BoxFit.fill);

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: AppState.instance),
          ],
          child: Builder(builder: (context) {
            return MaterialApp.router(
              routerConfig: goRouter,
              debugShowCheckedModeBanner: context.select<AppState, bool>((e) => e.debugShowCheckedModeBanner.value),
              onGenerateTitle: (context) => 'app title',
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
            );
          }),
        );
      });
}
