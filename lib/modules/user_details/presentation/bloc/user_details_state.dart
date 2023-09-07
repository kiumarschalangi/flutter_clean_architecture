import '../../domain/entities/user_entity.dart';

abstract class UserInfoState {}

class UserInfoLoadingState extends UserInfoState {}

class UserInfoLoadedState extends UserInfoState {
  final UserEntity user;

  UserInfoLoadedState({required this.user});
}

class UserInfoErrorState extends UserInfoState {}
