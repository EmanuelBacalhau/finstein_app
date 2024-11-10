import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/contants/app_color.dart';
import 'package:finstein_app/pages/login_page.dart';
import 'package:flutter/material.dart';

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
                delay: const Duration(milliseconds: 500),
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/finstein_gmbh_logo-removebg.png',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SlideInUp(
                delay: const Duration(milliseconds: 500),
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
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(double.infinity, 42),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: AppColor.mediumBlue,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: AppColor.mediumBlue,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: const Size(double.infinity, 42),
                          backgroundColor: AppColor.mediumBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
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
}
