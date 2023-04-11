import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery_app/config/theme/app_theme.dart';

import '../../core/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function()? onTap;
  final dynamic Function(dynamic)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool? isPassword;
  final String? Function(String?)? validate;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? suffixPressed;
  final bool? isClickable;
  final bool? autocorrect;
  final TextStyle? textStyle;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    this.type,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.textStyle,
    this.isPassword,
    this.validate,
    this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable,
    this.autocorrect,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      padding: EdgeInsets.symmetric(
      vertical: AppSize.h2,
        horizontal: AppSize.w20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      child: TextFormField(
        cursorColor: AppTheme.textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: textStyle,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword ?? false,
        enabled: isClickable ?? true,
        focusNode: focusNode,
        onTap: onTap,
        validator: validate,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}