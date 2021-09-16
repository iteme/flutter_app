import '/util/storage_utils.dart';

class AuthHelper {
  static String? _token;
  static String? _userId;

  static String? getToken() {
    _token ??= StorageUtils.getString(StorageUtils.token);
    return _token;
  }

  static Future<void> setToken(String? token) async {
    _token = token;
    await StorageUtils.save(StorageUtils.token, token);
  }

  static String? getUserId() {
    return _userId;
  }
}
