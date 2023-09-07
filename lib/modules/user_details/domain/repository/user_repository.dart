import '../entities/user_entity.dart';

// abstract class UserRepository {
//   Future<UserEntity> getUserDetails();
// }

abstract class UserRepository {
  Future<UserEntity> getUserInfo();
}
