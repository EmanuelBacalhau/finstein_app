import 'package:finstein_app/constants/app_theme.dart';
import 'package:finstein_app/pages/splash/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: AppTheme.theme,
    );
  }
}
