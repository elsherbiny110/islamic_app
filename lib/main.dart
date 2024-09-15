import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/moduls/hadeth/hadeth_details.dart';
import 'package:islamic_app/moduls/layout/layout_screen.dart';
import 'package:islamic_app/moduls/layout/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'core/thems/themes.dart';
import 'moduls/quran/quran_details.dart';
import 'moduls/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
    builder: (context, child) {
      return child!;
    },
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        startLocale: const Locale("ar"),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LayoutScreen.routeName: (_) => const LayoutScreen(),
        QuranDetails.routeName: (_) => QuranDetails(),
        HadethDetails.routeName: (_) => HadethDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
