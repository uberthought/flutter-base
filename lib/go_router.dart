import 'package:flutter/foundation.dart';
import 'package:flutter_base/pages/developer_page.dart';
import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';

final goRouter = GoRouter(
    initialLocation: kReleaseMode ? '/' : '/',
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(path: 'developer', builder: (context, state) => const DevelopeerPage()),
        ],
      ),
    ]);
