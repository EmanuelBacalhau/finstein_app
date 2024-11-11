import 'package:finstein_app/widgets/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final Widget widget;
  const LayoutPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const GradientAppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: widget,
      ),
    );
  }
}
