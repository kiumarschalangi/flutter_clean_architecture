import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_module/modules/user_details/domain/entities/user_entity.dart';

import '../../../user_details/constants/strings.dart';
import '../../../user_details/presentation/bloc/user_details_bloc.dart';
import '../../../user_details/presentation/widgets/blue_divider.dart';
import '../../../user_details/presentation/widgets/user_info_listtile.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<UserInfoBloc>(context).add(UserInfoEvent());
    return Scaffold(
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (BuildContext context, UserInfoState state) {
          if (state is UserInfoLoaded) {
            final UserEntity user = state.user;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                UserInfoListTile(
                  title: Strings.userName,
                  subTitle: user.userName,
                ),
                const BlueDivider(),
                UserInfoListTile(
                  title: Strings.email,
                  subTitle: user.email,
                ),
              ],
            );
          } else if (state is UserInfoError) {
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
