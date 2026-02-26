import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:api/features/users/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final login    = json['login']    as Map<String, dynamic>? ?? {};
    final name     = json['name']     as Map<String, dynamic>? ?? {};
    final picture  = json['picture']  as Map<String, dynamic>? ?? {};
    final location = json['location'] as Map<String, dynamic>? ?? {};
    final dob      = json['dob']      as Map<String, dynamic>? ?? {};

    return UserModel(
      id:        login['uuid']       as String? ?? '',
      firstName: name['first']       as String? ?? '',
      lastName:  name['last']        as String? ?? '',
      email:     json['email']       as String? ?? '',
      phone:     json['phone']       as String? ?? '',
      avatarUrl: picture['large']    as String? ?? '',
      gender:    json['gender']      as String? ?? '',
      country:   location['country'] as String? ?? '',
      city:      location['city']    as String? ?? '',
      age:       dob['age']          as int?    ?? 0,
    );
  }

  UserEntity toEntity() => UserEntity(
    id:        id,
    firstName: firstName,
    lastName:  lastName,
    email:     email,
    phone:     phone,
    avatarUrl: avatarUrl,
    gender:    gender,
    country:   country,
    city:      city,
    age:       age,
  );
}
