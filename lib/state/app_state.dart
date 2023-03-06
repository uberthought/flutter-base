import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState._();
  static Future<void> initialize() async => instance = AppState._();
  static late AppState instance;

  var _isTestMode = true;

  get isTestMode => _isTestMode;

  set isTestMode(value) {
    _isTestMode = value;
    notifyListeners();
  }
}
