import 'package:flutter/material.dart';
import 'package:nail_makeup/theme/app_theme.dart';

class NMAppBar extends StatelessWidget implements PreferredSizeWidget {
  NMAppBar({
    Key? key,
    this.title = '',
    this.appBarSize = 56.0,
    this.leading,
    this.action,
    this.appBarColor = AppColor.white500,
    this.textStyle = AppTextStyle.t16M,
    this.elevation = 2,
  }) : super(key: key);

  final String title;
  final double appBarSize;
  final Widget? leading;
  final List<Widget>? action;
  final TextStyle textStyle;
  final Color appBarColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          child: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(title, style: textStyle),
        leading: leading,
        actions: action,
        elevation: elevation,
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarSize);
}
