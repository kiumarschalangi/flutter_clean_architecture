import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/remote/get_user_api.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> getUserDetails() async {
    UserInfoApiController().getUserInfoFromApi(Uri());
    return const UserEntity('userName', 'email');
  }
}
