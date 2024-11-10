import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/constants/app_image.dart';
import 'package:finstein_app/pages/sign-up/page.dart';
import 'package:finstein_app/pages/welcome/page.dart';
import 'package:finstein_app/widgets/basic_button.dart';
import 'package:finstein_app/widgets/basic_input.dart';
import 'package:flutter/material.dart';
import 'package:finstein_app/constants/app_color.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Column(
          children: [
            SlideInUp(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(seconds: 1),
              child: Image.asset(AppImage.finsteinLogo),
            ),
            Expanded(
              child: SlideInUp(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: SlideInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(seconds: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  BasicInput(
                                    labelText: 'Email',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 8),
                                  BasicInput(
                                    labelText: 'Password',
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 16),
                                  BasicButton(
                                    onPressed: _handleSubmit,
                                    title: 'Sign In',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _redirectToSignUp,
                            style: TextButton.styleFrom(
                              minimumSize: const Size(double.infinity, 42),
                              backgroundColor: Colors.white,
                              overlayColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColor.lightBlue,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _redirectToWelcome() {
    Navigator.push(
      context,
      PageTransition(
        child: const WelcomePage(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _redirectToSignUp() {
    Navigator.push(
      context,
      PageTransition(
        child: const SignUpPage(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _redirectToWelcome();
    }
  }
}
