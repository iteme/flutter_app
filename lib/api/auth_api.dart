import '/model/common/api_result.dart';
import '/util/auth_helper.dart';
import '/util/http_utils.dart';

class AuthApi {
  static Future<String?> login(String username, String password) async {
    ApiResult<String> apiResult =
        await HttpUtils.post<String>('/auth/login', data: {'username': username, 'password': password});
    if (apiResult.success()) {
      String? token = apiResult.result;
      AuthHelper.setToken(token);
      return token;
    }
  }

  static Future<String?> refresh() async {
    ApiResult<String> apiResult = await HttpUtils.get<String>('/auth/refresh');
    if (apiResult.success()) {
      String? token = apiResult.result;
      AuthHelper.setToken(token);
      return token;
    }
  }
}
