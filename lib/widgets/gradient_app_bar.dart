import 'package:finstein_app/constants/app_image.dart';
import 'package:finstein_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.lightBlue,
            AppColor.mediumBlue,
            AppColor.darkBlue,
          ],
        ),
      ),
      child: SafeArea(
        child: Image.asset(
          AppImage.finsteinLogo,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
