import 'package:dio/dio.dart';

Dio buildDio(String baseUrl) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    headers: {'Content-Type': 'application/json'},
  ));
  dio.interceptors.add(LogInterceptor(
    requestBody: true, responseBody: true, requestHeader: false, responseHeader: false,
  ));
  return dio;
}