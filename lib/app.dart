import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'modules/user_details/presentation/bloc/user_details_bloc.dart';
import 'modules/user_details/presentation/screen/user_details_screen.dart.dart';

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
      home: BlocProvider<UserInfoBloc>(
        create: (BuildContext context) => UserInfoBloc(
          getUserInfo: getIt(),
        ),
        child: const UserDetailsScreen(),
      ),
    );
  }
}
