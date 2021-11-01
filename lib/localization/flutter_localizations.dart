import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NMLocalizations {
  final Locale locale;
  Map<String, dynamic>? _defaultSentences;
  Map<String, dynamic> _mainSentences = HashMap();

  Map<String, dynamic>? _defaultErrorCodeSentences;
  Map<String, dynamic> _mainErrorCodeSentences = HashMap();

  final bool isTest;

  NMLocalizations(this.locale, {this.isTest = false});

  static NMLocalizations? of(BuildContext context) {
    return Localizations.of<NMLocalizations>(context, NMLocalizations);
  }

  Future<NMLocalizations> loadTest(Locale locale) async {
    return NMLocalizations(locale);
  }

  /// Load json files and decode them
  Future<NMLocalizations> load() async {
    String defaultLanguage = await rootBundle
        .loadString('lib/assets/strings/${locale.languageCode}.json');
    this._defaultSentences = json.decode(defaultLanguage);

    String defaultErrorCodeLanguage = await rootBundle.loadString(
            'lib/assets/strings/errorCode/${locale.languageCode}.json');
    this._defaultErrorCodeSentences = json.decode(defaultErrorCodeLanguage);

    // this._mainSentences =
    //     await CommonConfig.getLanguageResourceFromRemote(locale.languageCode);
    // this._mainErrorCodeSentences =
    //     await CommonConfig.getLanguageErrorCodeResourceFromRemote(
    //         locale.languageCode);

    return NMLocalizations(locale);
  }

  String? getStringLabel(BuildContext context, String? key) {
    if (isTest) {
      return key;
    }

    if (key == null || key.isEmpty) {
      return key;
    }
    String ret = _mainSentences[key] ?? _defaultSentences![key] ?? key;
    return ret;
  }

  String getStringError(String key) {
    if (isTest) {
      return key;
    }

    String ret =
        _mainErrorCodeSentences[key] ?? _defaultErrorCodeSentences![key] ?? key;
    return ret;
  }
}
