import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final bool borderEnabled;
  final String label;
  final double fontSize;
  final void Function(String text) onChanged;
  final String? Function(String? text) validator;
  const InputText({
    super.key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnabled = true,
    required this.onChanged,
    required this.validator,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: fontSize,
      ),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: borderEnabled
            ? const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                ),
              )
            : InputBorder.none,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
