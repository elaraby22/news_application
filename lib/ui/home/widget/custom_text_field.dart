import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  MyValidator validator;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextField(
      {this.borderColor,
      required this.hintText,
      this.labelText,
      this.hintStyle,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.maxLines,
      this.validator,
      this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? AppStyles.medium12Grey,
        labelStyle: labelStyle ?? AppStyles.medium12Grey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.greyColor, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.greyColor, width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.greyColor, width: 2)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.greyColor, width: 2)),
      ),
    );
  }
}
