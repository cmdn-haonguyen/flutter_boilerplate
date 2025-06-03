import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/config/constants.dart';

class ApiService{
  late final Dio dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api_key'] = kApiKey;
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception('GET error: ${e.response?.data ?? e.message}');
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception('POST error: ${e.response?.data ?? e.message}');
    }
  }
}