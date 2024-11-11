import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/constants/app_color.dart';
import 'package:finstein_app/constants/app_image.dart';
import 'package:finstein_app/pages/welcome/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
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
      () => Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: const WelcomePage(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 300),
        ),
        (route) => false,
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
            delay: const Duration(seconds: 2),
            child: Image.asset(
              AppImage.finsteinLogo,
              width: 120,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
