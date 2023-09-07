import 'package:user_info_module/modules/user_info/data/repository/user_repository_impl.dart';

import '../entities/user_entity.dart';

class GetUserDetailsUseCase {
  GetUserDetailsUseCase(this.repository);

  final UserRepositoryImpl repository;

  Future<UserEntity> execute() async {
    return repository.getUserDetails();
  }
}
