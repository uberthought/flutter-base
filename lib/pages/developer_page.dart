import 'package:flutter/material.dart';
import 'package:flutter_base/state/app_state.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../scaffold/base_scaffold.dart';

class DevelopeerPage extends StatelessWidget {
  const DevelopeerPage({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(body: _Body());
}

class _Body extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) => Column(children: [
        ElevatedButton(
          onPressed: get<AppState>().isTestMode.toggle,
          child: const Text('Toggle Test Mode'),
        ),
        ElevatedButton(
          onPressed: get<AppState>().debugShowCheckedModeBanner.toggle,
          child: const Text('Toggle Debug Banner'),
        ),
      ]);
}
