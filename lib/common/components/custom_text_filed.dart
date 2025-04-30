import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';

class CustomTextFiled extends StatelessWidget {
  final label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Color borderColor;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextInputType keyboardType;
  CustomTextFiled({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    required this.borderColor,
    this.validator,
    this.onChanged,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return Container(
      height: 48,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.o),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.o,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.o),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.o,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.o),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.o,
            ),
          ),
          hintText: label,
          hintStyle: theme.testStyle.copyWith(
            fontSize: 14,
            color: tema.primaryColorDark,
          ),
        ),
      ),
    );
  }
}
