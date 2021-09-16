import 'package:dio/dio.dart';

import '/config/app_config.dart';
import '/model/common/api_result.dart';
import '/util/auth_helper.dart';
import '/util/log_utils.dart';
import '/util/route_utils.dart';
import '/util/toast_utils.dart';

class HttpUtils {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));

  static void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        if (AppConfig.ignoredList.contains(options.path)) {
          return handler.next(options);
        }
        _dio.lock();
        options.headers['token'] = AuthHelper.getToken();
        _dio.unlock();
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        LogUtils.debug('RequestHelper response. path=${response.requestOptions.path}, response=${response.data}');
        if (response.statusCode == 401) {
          LogUtils.warn('RequestHelper token invalid.');
          RouteUtils.goLogin();
        }
        return handler.next(response);
      },
    ));
    LogUtils.info('RequestHelper init.');
  }

  static Future<ApiResult<T>> _handleRequest<T>(Future<Response<Map<String, dynamic>>> Function() request) async {
    try {
      Response<Map<String, dynamic>> response = await request.call();
      if (response.statusCode == 200) {
        var data = response.data;
        if (data != null) {
          return ApiResult.fromJson(data);
        }
      }
      ToastUtils.showToast('Service Runaway');
      return Future.error('Service Runaway');
    } catch (error) {
      if (error is DioError) {
        if (error.type == DioErrorType.cancel) {
          return ApiResult(400, 'http canceled');
        }
      }
      LogUtils.warn('http error');
      return ApiResult(400, 'http error');
    }
  }

  static Future<ApiResult<T>> get<T>(String path, {Map<String, dynamic>? params}) async {
    return _handleRequest(() => _dio.get(path, queryParameters: params));
  }

  static Future<ApiResult<T>> post<T>(String path, {Map<String, dynamic>? params, Map<String, dynamic>? data}) async {
    return _handleRequest(() => _dio.post(path, queryParameters: params, data: data));
  }
}
