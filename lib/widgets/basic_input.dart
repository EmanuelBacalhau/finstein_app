import 'package:flutter/material.dart';

class BasicInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const BasicInput({
    super.key,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      textCapitalization: TextCapitalization.sentences,
      autocorrect: true,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
