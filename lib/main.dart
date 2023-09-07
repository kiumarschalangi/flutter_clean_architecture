import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_info_module/modules/user_details/data/data_sources/remote/user_remote_data_source.dart';
import 'package:user_info_module/modules/user_details/domain/usecases/user_details.dart';

import 'modules/user_details/data/data_sources/local/user_local_data_source.dart';
import 'modules/user_details/data/repository/user_repository_impl.dart';
import 'modules/user_details/domain/repository/user_repository.dart';
import 'modules/user_details/presentation/bloc/user_details_bloc.dart';
import 'modules/user_info/presentation/screen/user_details_screen.dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource());
  getIt.registerSingleton<UserLocalDataSource>(UserLocalDataSource());
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      remoteDataSource: getIt<UserRemoteDataSource>(),
      localDataSource: getIt<UserLocalDataSource>(),
    ),
  );
  getIt.registerSingleton<GetUserInfo>(
    GetUserInfo(userRepository: getIt<UserRepository>()),
  );
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            UserInfoBloc(getUserInfo: GetIt.I<GetUserInfo>()),
        child: const UserDetailsScreen(),
      ),
    );
  }
}
