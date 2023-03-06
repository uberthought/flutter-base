import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../scaffold/base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(
        body: _Body(),
        showBack: false,
      );
}

class _Body extends StatelessWidget with GetItMixin {
  _Body();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
