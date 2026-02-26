import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String avatarUrl,
    required String gender,
    required String country,
    required String city,
    required int age,
  }) = _UserEntity;

  String get fullName => '$firstName $lastName';
}
