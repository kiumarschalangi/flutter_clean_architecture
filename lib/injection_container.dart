import 'package:get_it/get_it.dart';
import 'modules/user_details/data/data_sources/local/user_local_data_source.dart';
import 'modules/user_details/data/data_sources/remote/user_remote_data_source.dart';
import 'modules/user_details/data/repository/user_repository_impl.dart';
import 'modules/user_details/domain/usecases/user_details.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource());
  // getIt.registerFactory<UserInfoBloc>(
  //     () => UserInfoBloc(getUserInfo: getIt<GetUserInfo>()));
  getIt.registerSingleton<UserLocalDataSource>(UserLocalDataSource());
  getIt.registerSingleton<UserRepositoryImpl>(
    UserRepositoryImpl(
      remoteDataSource: getIt<UserRemoteDataSource>(),
      localDataSource: getIt<UserLocalDataSource>(),
    ),
  );
  getIt.registerSingleton<GetUserInfo>(
    GetUserInfo(userRepository: getIt<UserRepositoryImpl>()),
  );
}
