import 'package:animate_do/animate_do.dart';
import 'package:finstein_app/constants/app_image.dart';
import 'package:finstein_app/pages/sign-in/page.dart';
import 'package:finstein_app/pages/welcome/page.dart';
import 'package:finstein_app/widgets/basic_button.dart';
import 'package:finstein_app/widgets/basic_input.dart';
import 'package:flutter/material.dart';
import 'package:finstein_app/constants/app_color.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
              child: Image.asset(
                AppImage.finsteinLogo,
                width: 120,
                height: 120,
              ),
            ),
            Expanded(
              child: SlideInUp(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign Up',
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
                                    labelText: 'Name',
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Name is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  BasicInput(
                                    labelText: 'Email',
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  BasicInput(
                                    labelText: 'Password',
                                    controller: _passwordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  BasicInput(
                                    labelText: 'Confirm Password',
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Confirm password is required';
                                      }

                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }

                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  BasicButton(
                                    onPressed: _handleSubmit,
                                    title: 'Sign Up',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _redirectToSignIn,
                            style: TextButton.styleFrom(
                              minimumSize: const Size(double.infinity, 42),
                              backgroundColor: Colors.white,
                              overlayColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColor.darkBlue,
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

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        ),
        (route) => false,
      );
    }
  }

  void _redirectToSignIn() {
    Navigator.push(
      context,
      PageTransition(
        child: const SignInPage(),
        type: PageTransitionType.leftToRight,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}
