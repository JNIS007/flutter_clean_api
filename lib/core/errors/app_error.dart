import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
abstract class AppError with _$AppError {
  const factory AppError.network({required String message}) = NetworkError;

  const factory AppError.server({
    required int statusCode,
    required String message,
  }) = ServerError;

  const factory AppError.parse({required String message}) = ParseError;

  const factory AppError.unknown({required String message}) = UnknownError;
}
