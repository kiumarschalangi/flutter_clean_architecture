import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../widgets/blue_divider.dart';
import '../widgets/user_info_listtile.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UserInfoListTile(
            title: Strings.userName,
            subTitle: 'kiumars_ch',
          ),
          BlueDivider(),
          UserInfoListTile(
            title: Strings.email,
            subTitle: 'kiumars@gmail.com',
          ),
        ],
      ),
    );
  }
}
