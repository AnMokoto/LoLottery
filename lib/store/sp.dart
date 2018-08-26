import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class SPHelper {
  SPHelper._();

  static Future<SharedPreferences> get prefs async {
    return await SharedPreferences.getInstance();
  }

  static Future<String> value({String key, String def: ""}) async {
    var _share = await prefs;
    return await _share.getString(key) ?? def;
  }

  static Future<bool> save({String key, String value}) async {
    var _share = await prefs;
    return await _share.setString(key, value);
  }

  static Future<bool> clear({String key}) async {
    return await save(key: key, value: null);
  }

  static Future<bool> clearAll() async {
    var _share = await prefs;
    return await _share.clear();
  }
}
