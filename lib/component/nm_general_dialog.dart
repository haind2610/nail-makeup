import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nail_makeup/theme/app_theme.dart';

class NMGeneralDialog extends StatelessWidget {
  NMGeneralDialog({
    Key? key,
    this.backgroundColor = AppColor.white500,
    required this.title,
    required this.content,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget? title;
  final String content;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // var dialogWidth = min<double>(width * 0.86, 400);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.radius_10,
        ),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius_10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.spaceS),
                title!,
                SizedBox(height: AppDimens.spaceS),
                Text(content, style: AppTextStyle.t16M),
                SizedBox(height: AppDimens.spaceS),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
