import 'package:flutter/material.dart';
import 'package:user_info_module/core/constants/sizes.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyle = Theme.of(context).textTheme;
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.xs),
        child: Text(title),
      ),
      subtitle: Text(subTitle),
      titleTextStyle: textStyle.titleLarge,
      subtitleTextStyle: textStyle.bodyLarge,
    );
  }
}
