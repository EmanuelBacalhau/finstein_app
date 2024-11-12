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
    return Container(
      width: 50,
      height: 34,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected
                ? Colors.white
                : Colors.grey.shade100.withOpacity(0.5),
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
        child: Text(
          title.substring(0, 3),
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.grey.shade100.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
