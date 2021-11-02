import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nail_makeup/localization/flutter_localizations.dart';
import 'package:nail_makeup/nm_main_screen.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        NMLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => NMMainScreen(),
      },

      debugShowCheckedModeBanner: false,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        if (locale == null) {
          debugPrint('*language locale is null!!!');
          return supportedLocales.first;
        }
        return supportedLocales.first;
      },
      // onGenerateRoute: AppRouter.router.generator,
    );
  }
}
