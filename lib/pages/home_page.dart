import 'package:flutter/material.dart';

import '../scaffold/base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const BaseScaffold(
        body: _Body(),
        showBack: false,
      );
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
