import 'package:flutter/material.dart';

import 'feature.dart';

class AppState extends ChangeNotifier {
  final isTestMode = Feature(true, 'isTestMode');
  final debugShowCheckedModeBanner = Feature(true, 'debugShowCheckedModeBanner');
}
