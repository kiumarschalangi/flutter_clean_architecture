import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/local/user_local_data_source.dart';
import '../data_sources/remote/user_remote_data_source.dart';

// class UserRepositoryImpl implements UserRepository {
//   @override
//   Future<UserEntity> getUserDetails() async {
//     UserInfoApiController().getUserInfoFromApi(Uri());
//     return const UserEntity(
//       userName: 'kiumars_ch',
//       email: 'kiumarsch96@gmail.com',
//     );
//   }
// }

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  @override
  Future<UserEntity> getUserInfo() async {
    // whether to fetch data from remote or local storage can be implemented here.
    await Future.delayed(const Duration(seconds: 1));
    return const UserEntity(userName: 'kiumars_ch', email: 'email');
  }
}
