import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
abstract class AppException with _$AppException {
  const factory AppException.network({
    @Default('Check your internet connection.') String message,
  }) = NetworkException;

  const factory AppException.server({
    required int statusCode,
    @Default('Server error.') String message,
  }) = ServerException;

  const factory AppException.parse({
    @Default('Could not read server response.') String message,
  }) = ParseException;

  const factory AppException.unknown({
    @Default('Something went wrong.') String message,
  }) = UnknownException;
}
