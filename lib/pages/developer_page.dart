import 'package:flutter/material.dart';
import 'package:flutter_base/state/app_state.dart';

import '../scaffold/base_scaffold.dart';

class DevelopeerPage extends StatelessWidget {
  const DevelopeerPage({super.key});

  @override
  Widget build(BuildContext context) => const BaseScaffold(
        body: _Body(),
      );
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: AppState.instance.isTestMode.toggle, child: const Text('Toggle Test Mode')),
        ElevatedButton(onPressed: AppState.instance.debugShowCheckedModeBanner.toggle, child: const Text('Toggle Debug Banner')),
      ],
    );
  }
}
