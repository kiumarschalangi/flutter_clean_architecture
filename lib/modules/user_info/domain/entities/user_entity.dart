import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity(this.userName, this.email);
  final String userName;
  final String email;

  @override
  List<Object> get props => <Object>[
        userName,
        email,
      ];
}
