import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionBuilder extends StatelessWidget {
  const AppVersionBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, String version) builder;

  @override
  Widget build(BuildContext context) => FutureBuilder<String>(
      future: Future<String>(() async => (await PackageInfo.fromPlatform()).version),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done || snapshot.data == null) return Container();
        return builder.call(context, snapshot.data!);
      });
}
