import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../scaffold/base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(body: const _Body());
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ElevatedButton(onPressed: () => context.go('/developer'), child: const Text('Go to Developer page')),
          const Placeholder(),
        ],
      );
}
