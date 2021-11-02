import 'package:flutter/material.dart';
import 'package:nail_makeup/app/app.dart';
import 'package:nail_makeup/app/app_config.dart';

void main() {
  AppConfig.fromFlavor(flavor: Flavor.PRODUCTION);

  runApp(Application());
}
