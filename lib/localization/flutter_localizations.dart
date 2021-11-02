import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nail_makeup/localization/flutter_localizations_delegate.dart';

class NMLocalizations {
  final Locale locale;
  NMLocalizations(this.locale);

  static NMLocalizations? of(BuildContext context) {
    return Localizations.of<NMLocalizations>(context, NMLocalizations);
  }

  static const LocalizationsDelegate<NMLocalizations> delegate =
      NMLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  /// Load json files and decode them
  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('lib/assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String getStringLabel(String key) {
    return _localizedStrings![key]!;
  }
}
