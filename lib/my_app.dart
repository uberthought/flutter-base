import 'dart:async';

import 'package:flutter/material.dart';

import 'router_definition.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _initalize = Future(() async {});

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
      future: _initalize,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return Image.asset('assets/splash.jpg', fit: BoxFit.fill);

        return MaterialApp.router(
          routerConfig: routerDefinition,
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => 'app title',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
        );
      });
}
