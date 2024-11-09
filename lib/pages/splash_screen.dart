import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/contants/app_color.dart';
import 'package:finstein_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _setFullScreenMode();
    _navigateToHomePage();
  }

  void _setFullScreenMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void _navigateToHomePage() {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.lightBlue,
            AppColor.mediumBlue,
            AppColor.darkBlue,
          ],
        ),
      ),
      child: ZoomIn(
        duration: const Duration(seconds: 5),
        child: Spin(
          child: Bounce(
            delay: Duration(seconds: 2),
            child: Image.asset(
              'assets/images/finstein_gmbh_logo-removebg.png',
              width: 120,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
