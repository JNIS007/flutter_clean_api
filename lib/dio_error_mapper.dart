import 'package:api/app_exception.dart';
import 'package:dio/dio.dart';

class DioErrorMapper {
  DioErrorMapper._();

  static AppException map(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout => AppException.network(
        message: 'Connection timed out. Check your internet.',
      ),
      DioExceptionType.receiveTimeout => AppException.network(
        message: 'Server is taking too long to respond.',
      ),
      DioExceptionType.sendTimeout => AppException.network(
        message: 'Request timed out while sending data.',
      ),
      DioExceptionType.connectionError => AppException.network(
        message: 'No internet connection.',
      ),
      DioExceptionType.badResponse => _mapStatusCode(error.response),
      DioExceptionType.cancel => const AppException.unknown(
        message: 'Request was cancelled.',
      ),
      _ => AppException.unknown(
        message: error.message ?? 'An unexpected error occurred.',
      ),
    };
  }

  static AppException _mapStatusCode(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    final message = _extractMessage(response) ?? _defaultMessage(statusCode);
    return AppException.server(statusCode: statusCode, message: message);
  }

  static String? _extractMessage(Response? response) {
    try {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        return data['message'] as String?;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static String _defaultMessage(int code) {
    return switch (code) {
      400 => 'Bad request.',
      401 => 'Unauthorized. Please log in.',
      403 => 'You do not have permission.',
      404 => 'Resource not found.',
      422 => 'Validation failed.',
      429 => 'Too many requests. Please slow down.',
      500 => 'Internal server error.',
      503 => 'Service unavailable.',
      _ => 'Server returned error $code.',
    };
  }
}
