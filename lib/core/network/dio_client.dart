import 'package:api/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = _buildDio();

  static Dio _buildDio() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) => status != null && status < 500,
    );

    final dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('┌── 🌐 REQUEST ───────────────────────────────────');
          print('│ ${options.method} ${options.uri}');
          if (options.queryParameters.isNotEmpty) {
            print('│ Params: ${options.queryParameters}');
          }
          print('└────────────────────────────────────────────────');
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('┌── ✅ RESPONSE ──────────────────────────────────');
          print('│ ${response.statusCode} ${response.requestOptions.uri}');
          print('└────────────────────────────────────────────────');
          handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print('┌── ❌ ERROR ─────────────────────────────────────');
          print('│ Type: ${error.type}');
          print('│ Message: ${error.message}');
          print('└────────────────────────────────────────────────');
          handler.next(error);
        },
      ),
    );
    return dio;
  }
}
