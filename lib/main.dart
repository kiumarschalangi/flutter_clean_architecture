import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_info_module/modules/user_details/data/data_sources/remote/user_remote_data_source.dart';
import 'package:user_info_module/modules/user_details/domain/usecases/user_details.dart';

import 'app.dart';
import 'modules/user_details/data/data_sources/local/user_local_data_source.dart';
import 'modules/user_details/data/repository/user_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GetIt getIt = GetIt.instance;
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
  await Hive.initFlutter();
  await UserLocalDataSource().initialize();

  runApp(const MyApp());
}
