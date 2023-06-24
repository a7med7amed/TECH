import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech/core/utils/app_router.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        AppRouter.pop(context: context);
      }),
      icon: const Icon(FontAwesomeIcons.chevronLeft),
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }
}
