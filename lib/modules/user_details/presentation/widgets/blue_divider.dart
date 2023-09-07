import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';

class BlueDivider extends StatelessWidget {
  const BlueDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      indent: Sizes.ss,
      endIndent: Sizes.ss,
      color: Colors.blueGrey,
    );
  }
}
