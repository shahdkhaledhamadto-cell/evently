import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/my_theme_data.dart';
import 'package:evently/features/add_event/add_event_screen.dart';
import 'package:evently/features/forget_password/forget_password_screen.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/login/login.dart';
import 'package:evently/features/onboarding/onboarding_screen.dart';
import 'package:evently/features/register/register_screen.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      routes: {
        OnboardingScreen.routeName: (c) => OnboardingScreen(),
        LoginScreen.routeName: (c) => LoginScreen(),
        RegisterScreen.routeName: (c) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (c) => ForgetPasswordScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        AddEventScreen.routeName: (c) => AddEventScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
