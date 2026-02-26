import 'package:api/features/users/domain/entities/user_entity.dart';
import 'package:api/features/users/domain/repositories/user_repository.dart';
import 'package:api/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<({List<UserEntity> users, bool hasMore})> getUsers({
    required int page,
    required int limit,
  }) async {
    final models = await _dataSource.getUsers(page: page, limit: limit);

    return (
      users: models.map((m) => m.toEntity()).toList(),
      hasMore: models.length == limit,
    );
  }

  @override
  Future<UserEntity> getUserById(String id) async {
    final model = await _dataSource.getUserById(id);
    return model.toEntity();
  }
}
