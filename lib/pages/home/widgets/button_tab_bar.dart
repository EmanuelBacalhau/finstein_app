import 'package:finstein_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class ButtonTabBar extends StatelessWidget {
  final Function() onPressed;
  final bool isSelected;
  final String title;

  const ButtonTabBar({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? AppColor.darkBlue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: isSelected
              ? const BorderSide(
                  color: AppColor.darkBlue,
                )
              : const BorderSide(
                  color: AppColor.lightBlue,
                ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title.substring(0, 3),
        style: TextStyle(
          color: isSelected ? Colors.white : AppColor.lightBlue,
        ),
      ),
    );
  }
}
