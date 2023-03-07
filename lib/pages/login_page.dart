import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../scaffold/base_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(body: _Body());
}

class _Body extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) => Column(children: const [
        Text('LOG IN PAGE'),
        Placeholder(),
      ]);
}
