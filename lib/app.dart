import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:user_info_module/modules/user_details/domain/usecases/user_details.dart';

import 'modules/user_details/presentation/bloc/user_details_bloc.dart';
import 'modules/user_info/presentation/screen/user_details_screen.dart.dart';

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
