import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
