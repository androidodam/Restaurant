import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/keys.dart';
import 'package:flutter_restaurant_app/view/auth/start_screen.dart';
import 'package:flutter_restaurant_app/view/bnb/bnb.dart';
import 'package:flutter_restaurant_app/view_model/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  if (pref.getString("language") == null) {
    await pref.setString("language", "uz");
  }
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: pref.getString("language") ?? "uz",
      supportedLocales: ["uz", "ru", "en"]);

  bool isLogedIn = pref.getBool("is_loged_in") ?? false;

  Widget initialPage = isLogedIn ? Bnb() : StartScreen();

  themeNotifier.init();
  runApp(LocalizedApp(delegate, ProviderScope(child: MyApp(initialPage))));
}

class MyApp extends StatelessWidget {
  final Widget initialPage;
  const MyApp(this.initialPage, {super.key, required});

  @override
  Widget build(BuildContext context) {
    final local = LocalizedApp.of(context).delegate;
    lang = pref.getString("language") ?? local.currentLocale.languageCode;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.watch(themeProvider);
          return MaterialApp(
            locale: Locale(lang),
            supportedLocales: local.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              local
            ],
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: notifier.themeMode,
            debugShowCheckedModeBanner: false,
            home: initialPage,
          );
        },
      ),
    );
  }
}
