import 'package:api/core/constants/api_constants.dart';
import 'package:api/core/errors/app_error.dart';
import 'package:api/core/network/dio_client.dart';
import 'package:api/features/users/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers({required int page, required int limit});
  Future<UserModel> getUserById(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({DioClient? client})
      : _dio = (client ?? DioClient()).dio;

  @override
  Future<List<UserModel>> getUsers({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.users,
        queryParameters: {'page': page, 'limit': limit},
      );

      final outerData = response.data['data'] as Map<String, dynamic>;
      final userList = outerData['data'] as List<dynamic>;

      return userList
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw AppError.unknown(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    try {
      final response = await _dio.get(ApiConstants.getUserById(id));
      final data = response.data['data'] as Map<String, dynamic>;
      return UserModel.fromJson(data);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw AppError.unknown(message: e.toString());
    }
  }

  AppError _mapDioError(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError =>
        AppError.network(message: 'No internet connection. Please check your network.'),
      DioExceptionType.badResponse => AppError.server(
          statusCode: e.response?.statusCode ?? 0,
          message: _parseServerMessage(e.response),
        ),
      _ => AppError.unknown(message: e.message ?? 'Unknown error'),
    };
  }

  String _parseServerMessage(Response? response) {
    try {
      return response?.data['message'] as String? ?? 'Server error';
    } catch (_) {
      return 'Server error (${response?.statusCode})';
    }
  }
}
