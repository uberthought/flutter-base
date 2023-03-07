import 'package:flutter/foundation.dart';
import 'pages/developer_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/private_page.dart';
import 'state/user_state.dart';

final goRouter = GoRouter(
    initialLocation: kReleaseMode ? '/' : '/',
    redirect: (context, state) {
      if (!GetIt.I<UserState>().isLoggedIn.value) {
        switch (state.location.split('?').first) {
          case '/private':
            return '/login';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(path: 'private', builder: (context, state) => const PrivatePage()),
          GoRoute(path: 'login', builder: (context, state) => const LoginPage()),
          GoRoute(path: 'developer', builder: (context, state) => const DeveloperPage()),
        ],
      ),
    ]);
