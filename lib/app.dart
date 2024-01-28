import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluffy_challenge_week_3/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
              useMaterial3: true,
              fontFamily: 'AldotheApache',
              scheme: FlexScheme.flutterDash)
          .copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
