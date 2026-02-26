import 'package:api/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<({List<UserEntity> users, bool hasMore})> getUsers({
    required int page,
    required int limit,
  });

  Future<UserEntity> getUserById(String id);
}
