import 'package:flutter/material.dart';
import 'package:nail_makeup/component/nm_general_dialog.dart';
import 'package:nail_makeup/theme/app_theme.dart';

class UtilsUI {
  static showNMGeneraDialog(
    BuildContext context, {
    Color barrierColor = Colors.transparent,
    bool dismissable = true,
    Widget? title,
  }) {
    return showDialog(
      barrierColor: barrierColor,
      barrierDismissible: dismissable,
      context: context,
      builder: (BuildContext context) => NMGeneralDialog(
        title: Icon(Icons.cancel, size: 48),
        content: '325',
        backgroundColor: AppColor.black100,
      ),
    );
  }
}
