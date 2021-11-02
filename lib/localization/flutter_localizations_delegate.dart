import 'dart:async';

import 'package:flutter/material.dart';

import 'flutter_localizations.dart';

class NMLocalizationsDelegate extends LocalizationsDelegate<NMLocalizations> {
  static List<Locale> get supportedLocales =>
      [const Locale('en', 'US'), const Locale('vi', 'VN')];

  const NMLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    if (supportedLocales.any((l) => l.languageCode == locale.languageCode)) {
      return true;
    }
    return false;
  }

  @override
  Future<NMLocalizations> load(Locale locale) async {
    NMLocalizations localizations = new NMLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NMLocalizations> old) {
    return false;
  }
}
