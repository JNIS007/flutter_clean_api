import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = UsersLoading;

  const factory UsersState.loaded({
    required List<UserEntity> users,
    required int currentPage,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = UsersLoaded;

  const factory UsersState.error({
    required String message,
  }) = UsersError;
}
