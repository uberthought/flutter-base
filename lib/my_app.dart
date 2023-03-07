import 'dart:async';

import 'package:flutter/material.dart';
import 'state/user_state.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'go_router.dart';
import 'state/app_state.dart';

class MyApp extends StatefulWidget with GetItStatefulWidgetMixin {
  MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with GetItStateMixin {
  late final _initalize = Future(() async {
    GetIt.I.registerSingleton(AppState());
    GetIt.I.registerSingleton(UserState());
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
      future: _initalize,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return Image.asset('assets/splash.png', fit: BoxFit.fill);

        return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: watchX<AppState, bool>((e) => e.debugShowCheckedModeBanner),
          onGenerateTitle: (context) => 'app title',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
        );
      });
}
