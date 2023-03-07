import 'package:flutter/material.dart';
import '../state/user_state.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../scaffold/base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(body: _Body());
}

class _Body extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = watchX<UserState, bool>((e) => e.isLoggedIn);

    return Column(
      children: [
        ElevatedButton(onPressed: () => context.go('/developer'), child: const Text('Go to Developer page')),
        ElevatedButton(
            onPressed: isLoggedIn ? () => context.go('/private') : null, child: const Text('Go to Private page')),
        ElevatedButton(
            onPressed: !isLoggedIn ? () => context.go('/login') : null, child: const Text('Go to Login page')),
        ElevatedButton(onPressed: isLoggedIn ? () => context.go('/logout') : null, child: const Text('Logout')),
        const Placeholder(),
      ],
    );
  }
}
