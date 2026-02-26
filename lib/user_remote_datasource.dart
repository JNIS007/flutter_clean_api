import 'package:api/app_exception.dart';
import 'package:api/core/constants/api_constants.dart';
import 'package:api/core/network/dio_client.dart';
import 'package:api/dio_error_mapper.dart';
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
      final Response response = await _dio.get(
        ApiConstants.users,
        queryParameters: {'page': page, 'limit': limit},
      );

      final Map<String, dynamic> body = response.data as Map<String, dynamic>;
      final Map<String, dynamic> outerData = body['data'] as Map<String, dynamic>;
      final List<dynamic> userList = outerData['data'] as List<dynamic>;

      return userList
          .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    } on TypeError catch (e) {
      throw AppException.parse(message: 'Unexpected response format: ${e.toString()}');
    } catch (e) {
      throw AppException.unknown(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    try {
      final Response response = await _dio.get(ApiConstants.getUserById(id));

      final Map<String, dynamic> body = response.data as Map<String, dynamic>;
      final Map<String, dynamic> userData = body['data'] as Map<String, dynamic>;

      return UserModel.fromJson(userData);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    } on TypeError catch (e) {
      throw AppException.parse(message: 'Unexpected response format: $e');
    } catch (e) {
      throw AppException.unknown(message: e.toString());
    }
  }
}
