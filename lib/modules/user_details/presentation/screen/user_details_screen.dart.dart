import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_module/modules/user_details/presentation/bloc/user_details_event.dart';

import '../../../../core/constants/strings.dart';
import '../bloc/user_details_bloc.dart';
import '../bloc/user_details_state.dart';
import '../widgets/blue_divider.dart';
import '../widgets/user_info_listtile.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserInfoBloc>().add(GetUserInfoEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (BuildContext context, UserInfoState state) {
          if (state is UserInfoLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                UserInfoListTile(
                  title: Strings.userName,
                  subTitle: state.user.userName,
                ),
                const BlueDivider(),
                UserInfoListTile(
                  title: Strings.email,
                  subTitle: state.user.email,
                ),
              ],
            );
          } else if (state is UserInfoErrorState) {
            return const Center(child: Text(Strings.error));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
