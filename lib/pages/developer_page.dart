import 'package:flutter/material.dart';
import '../state/app_state.dart';
import '../state/user_state.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../scaffold/base_scaffold.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

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
        if (watchX<UserState, bool>((e) => e.isLoggedIn))
          const Text('Is Logged In')
        else
          const Text('Is Not Logged In'),
        ElevatedButton(
          onPressed: () => get<UserState>().isLoggedIn.value = !get<UserState>().isLoggedIn.value,
          child: const Text('Toggle Logged In'),
        ),
      ]);
}
