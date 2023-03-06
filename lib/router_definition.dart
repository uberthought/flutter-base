import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';

final routerDefinition = GoRouter(
    initialLocation: kReleaseMode ? '/' : '/',
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => const HomePage(),
      ),
    ]);
