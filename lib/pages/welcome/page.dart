import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/constants/app_color.dart';
import 'package:finstein_app/constants/app_image.dart';
import 'package:finstein_app/pages/sign-in/page.dart';
import 'package:finstein_app/pages/sign-up/page.dart';
import 'package:finstein_app/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        padding: const EdgeInsets.only(
          top: 24,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: SlideInUp(
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  AppImage.finsteinLogo,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SlideInUp(
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome to Finstein',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Take control of your finances and achieve your goals intelligently and effortlessly.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 24),
                      BasicButton(
                        onPressed: _navigateToSignInPage,
                        title: 'Sign In',
                        isOutline: true,
                      ),
                      BasicButton(
                        onPressed: _navigateToSignUpPage,
                        title: 'Sign Up',
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToSignInPage() {
    Navigator.push(
      context,
      PageTransition(
        child: const SignInPage(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  void _navigateToSignUpPage() {
    Navigator.push(
      context,
      PageTransition(
        child: const SignUpPage(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}
