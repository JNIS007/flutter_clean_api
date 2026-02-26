import 'package:api/features/users/domain/repositories/user_repository.dart';
import 'package:api/features/users/domain/repositories/user_repository_impl.dart';
import 'package:api/features/users/domain/usecases/get_users_usecase.dart';
import 'package:api/features/users/presentation/providers/users_state.dart';
import 'package:api/user_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final userDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userDataSourceProvider));
});

final getUsersUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  return GetUsersUseCase(ref.watch(userRepositoryProvider));
});

class UsersNotifier extends StateNotifier<UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersNotifier(this._getUsersUseCase) : super(const UsersState.loading()) {
    fetchUsers();
  }

  static const int _limit = 10;

  Future<void> fetchUsers() async {
    state = const UsersState.loading();

    try {
      final result = await _getUsersUseCase(page: 1, limit: _limit);
      state = UsersState.loaded(
        users: result.users,
        currentPage: 1,
        hasMore: result.hasMore,
      );
    } on Object catch (e) {
      state = UsersState.error(message: e.toString());
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! UsersLoaded) return;
    if (!current.hasMore || current.isLoadingMore) return;

    state = current.copyWith(isLoadingMore: true);

    try {
      final nextPage = current.currentPage + 1;
      final result = await _getUsersUseCase(page: nextPage, limit: _limit);

      state = UsersLoaded(
        users: [...current.users, ...result.users],
        currentPage: nextPage,
        hasMore: result.hasMore,
        isLoadingMore: false,
      );
    } on Object catch (_) {
      state = current.copyWith(isLoadingMore: false);
    }
  }

  Future<void> refresh() => fetchUsers();
}

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  return UsersNotifier(ref.watch(getUsersUseCaseProvider));
});
