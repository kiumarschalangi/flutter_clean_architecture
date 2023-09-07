import 'package:user_info_module/modules/user_details/data/repository/user_repository_impl.dart';
import 'package:user_info_module/modules/user_details/domain/entities/user_entity.dart';

class GetUserInfo {
  GetUserInfo({required this.userRepository});

  final UserRepositoryImpl userRepository;

  Future<UserEntity> execute() {
    return userRepository.getUserInfo();
  }
}
