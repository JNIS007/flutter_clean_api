// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState()';
}


}

/// @nodoc
class $UsersStateCopyWith<$Res>  {
$UsersStateCopyWith(UsersState _, $Res Function(UsersState) __);
}


/// Adds pattern-matching-related methods to [UsersState].
extension UsersStatePatterns on UsersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsersLoading value)?  loading,TResult Function( UsersLoaded value)?  loaded,TResult Function( UsersError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsersLoading() when loading != null:
return loading(_that);case UsersLoaded() when loaded != null:
return loaded(_that);case UsersError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsersLoading value)  loading,required TResult Function( UsersLoaded value)  loaded,required TResult Function( UsersError value)  error,}){
final _that = this;
switch (_that) {
case UsersLoading():
return loading(_that);case UsersLoaded():
return loaded(_that);case UsersError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsersLoading value)?  loading,TResult? Function( UsersLoaded value)?  loaded,TResult? Function( UsersError value)?  error,}){
final _that = this;
switch (_that) {
case UsersLoading() when loading != null:
return loading(_that);case UsersLoaded() when loaded != null:
return loaded(_that);case UsersError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<UserEntity> users,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsersLoading() when loading != null:
return loading();case UsersLoaded() when loaded != null:
return loaded(_that.users,_that.currentPage,_that.hasMore,_that.isLoadingMore);case UsersError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<UserEntity> users,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case UsersLoading():
return loading();case UsersLoaded():
return loaded(_that.users,_that.currentPage,_that.hasMore,_that.isLoadingMore);case UsersError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<UserEntity> users,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case UsersLoading() when loading != null:
return loading();case UsersLoaded() when loaded != null:
return loaded(_that.users,_that.currentPage,_that.hasMore,_that.isLoadingMore);case UsersError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UsersLoading implements UsersState {
  const UsersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.loading()';
}


}




/// @nodoc


class UsersLoaded implements UsersState {
  const UsersLoaded({required final  List<UserEntity> users, required this.currentPage, required this.hasMore, this.isLoadingMore = false}): _users = users;
  

 final  List<UserEntity> _users;
 List<UserEntity> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  int currentPage;
 final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersLoadedCopyWith<UsersLoaded> get copyWith => _$UsersLoadedCopyWithImpl<UsersLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersLoaded&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'UsersState.loaded(users: $users, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $UsersLoadedCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersLoadedCopyWith(UsersLoaded value, $Res Function(UsersLoaded) _then) = _$UsersLoadedCopyWithImpl;
@useResult
$Res call({
 List<UserEntity> users, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$UsersLoadedCopyWithImpl<$Res>
    implements $UsersLoadedCopyWith<$Res> {
  _$UsersLoadedCopyWithImpl(this._self, this._then);

  final UsersLoaded _self;
  final $Res Function(UsersLoaded) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(UsersLoaded(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UsersError implements UsersState {
  const UsersError({required this.message});
  

 final  String message;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersErrorCopyWith<UsersError> get copyWith => _$UsersErrorCopyWithImpl<UsersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UsersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UsersErrorCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersErrorCopyWith(UsersError value, $Res Function(UsersError) _then) = _$UsersErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UsersErrorCopyWithImpl<$Res>
    implements $UsersErrorCopyWith<$Res> {
  _$UsersErrorCopyWithImpl(this._self, this._then);

  final UsersError _self;
  final $Res Function(UsersError) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UsersError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
