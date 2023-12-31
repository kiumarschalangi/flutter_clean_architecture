import 'package:equatable/equatable.dart';

import '../../data/models/user.dart';

class UserEntity extends Equatable {
  const UserEntity({required this.userName, required this.email});
  final String userName;
  final String email;

  factory UserEntity.toEntity(User loginResponse) {
    return UserEntity(
      userName: loginResponse.userName ?? '',
      email: loginResponse.email ?? '',
    );
  }

  @override
  List<Object> get props => <Object>[
        userName,
        email,
      ];
}
