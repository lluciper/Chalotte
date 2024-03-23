import 'package:flutter/material.dart';

import '../../constants/app_text_style.dart';
import '../../gen/assets.gen.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, this.title = ''})
      : preferredSize = const Size.fromHeight(56);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          child: Assets.iconsBack.svg(),
        ),
      ),
      title: Text(
        title,
        style: LuStyle.textSmallBold,
      ),
      centerTitle: true,
      actions: [
        Center(
          child: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            child: Assets.iconsClose.svg(width: 28, height: 28),
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
