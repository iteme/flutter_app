import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/util/log_utils.dart';

class StorageUtils {
  // token
  static const String token = 'token';
  // 首次安装
  static const String firstInstall = 'firstInstall';
  // 同意许可协议
  static const String protocolAgreed = 'protocolAgreed';

  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    LogUtils.info('StorageHelper init.');
  }

  // 清除数据
  static void remove(String key) async {
    if (_sharedPreferences!.containsKey(key)) {
      _sharedPreferences!.remove(key);
    }
  }

  // 保存基本数据类型
  static Future<bool?> save(String key, dynamic value) async {
    if (value is String) {
      return _sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return _sharedPreferences!.setDouble(key, value);
    } else if (value is int) {
      return _sharedPreferences!.setInt(key, value);
    } else if (value is List<String>) {
      return _sharedPreferences!.setStringList(key, value);
    }
    return false;
  }

  // 异步读取
  static String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  static int? getInt(String key) {
    return _sharedPreferences!.getInt(key);
  }

  static bool? getBool(String key) {
    return _sharedPreferences!.getBool(key);
  }

  static double? getDouble(String key) {
    return _sharedPreferences!.getDouble(key);
  }

  // 保存对象
  static Future<bool> saveObject(String key, dynamic value) async {
    return _sharedPreferences!.setString(key, json.encode(value));
  }

  // 获取对象
  static Map<String, dynamic>? getObject(String key) {
    String? _data = _sharedPreferences!.getString(key);
    if (_data == null || _data.isEmpty) {
      return null;
    }
    return json.decode(_data);
  }
}
