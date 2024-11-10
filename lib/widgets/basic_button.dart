import 'package:flutter/material.dart';
import 'package:finstein_app/constants/app_color.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isDisabled;
  final bool isOutline;

  const BasicButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDisabled = false,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 42),
        backgroundColor: isOutline ? Colors.white : AppColor.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: isOutline
              ? const BorderSide(color: AppColor.lightBlue)
              : BorderSide.none,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isOutline ? AppColor.lightBlue : Colors.white,
        ),
      ),
    );
  }
}
