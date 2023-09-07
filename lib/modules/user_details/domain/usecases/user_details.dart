// import '../../data/repository/user_repository_impl.dart';
// import '../entities/user_entity.dart';

// class GetUserDetailsUseCase {
//   GetUserDetailsUseCase(this.repository);

//   final UserRepositoryImpl repository;

//   Future<UserEntity> execute() async {
//     return repository.getUserDetails();
//   }
// }
import 'package:user_info_module/modules/user_details/domain/entities/user_entity.dart';

import '../repository/user_repository.dart';

class GetUserInfo {
  GetUserInfo({required this.userRepository});

  final UserRepository userRepository;

  Future<UserEntity> execute() {
    return userRepository.getUserInfo();
  }
}
