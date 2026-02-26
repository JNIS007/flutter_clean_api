import 'package:api/features/users/domain/entities/user_entity.dart';
import 'package:api/features/users/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  Future<({List<UserEntity> users, bool hasMore})> call({
    required int page,
    required int limit,
  }) {
    return _repository.getUsers(page: page, limit: limit);
  }
}
