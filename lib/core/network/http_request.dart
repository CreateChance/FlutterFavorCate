
import 'dart:io';

import 'package:dio/dio.dart';

enum HttpMethod {
  GET("get"),
  POST("post"),
  PUT("put"),
  DELETE("delete"),
  HEAD("head");

  final String _name;

  const HttpMethod(this._name);
}

class FavorHttpRequest {
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://123.207.32.32:8001/api",
    connectTimeout: 5000
  );

  static final Dio _dio = Dio(_baseOptions);

  static Future<T> request<T>(String path, {HttpMethod method = HttpMethod.GET, Map<String, dynamic>? params, Interceptor? interceptor}) async {
    final options = Options(method: method._name);

    Interceptor internalInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        print('开始请求：$path');
        handler.next(requestOptions);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print("请求成功: $path");
        handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        print("请求失败: $path, error: $error");
        handler.next(error);
      }
    );

    List<Interceptor> interceptors = [internalInterceptor];
    if (interceptor != null) {
      interceptors.add(interceptor);
    }

    _dio.interceptors.addAll(interceptors);

    try {
      Response response = await _dio.request(path, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}