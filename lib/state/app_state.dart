import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  static late AppState instance;

  AppState._();
  static Future<void> initialize() async {
    instance = AppState._();
    await instance._initialize();
  }

  Future<void> _initialize() async {
    isTestMode.addListener(notifyListeners);
    debugShowCheckedModeBanner.addListener(notifyListeners);
  }

  final isTestMode = Feature(true, 'isTestMode');
  final debugShowCheckedModeBanner = Feature(true, 'debugShowCheckedModeBanner');
}

class Feature extends ValueNotifier<bool> {
  late final SharedPreferences _prefs;
  String key;

  Feature(super.value, this.key) {
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    _prefs = await SharedPreferences.getInstance();
    value = _prefs.getBool(key) ?? value;
  }

  void toggle() {
    value = !value;
    _prefs.setBool(key, value);
  }
}
