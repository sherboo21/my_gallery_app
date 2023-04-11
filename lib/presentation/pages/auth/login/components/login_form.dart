import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_theme.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/validation.dart';
import '../../../../widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController userNameController , passwordController;
  final FocusNode passwordFocusNode;
  const LoginForm({
    Key? key,
    required this.userNameController,
    required this.passwordController
    , required this.passwordFocusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.login,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: AppTheme.textColor
          ),
        ),
        AppSize.h30.ph,
        CustomTextField(
          hint: AppStrings.userName,
          type: TextInputType.name,
          controller: userNameController,
          textStyle:  TextStyle(
              color: AppTheme.hintTextColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500
          ),
          validate: (val) =>validator(val,
              AppStrings.userNameValidation,
              val!.isEmpty ),
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
        ),
        AppSize.h30.ph,
        CustomTextField(
          hint: AppStrings.password,
          isPassword: true,
          type: TextInputType.visiblePassword,
          focusNode: passwordFocusNode,
          controller: passwordController,
          textStyle:  TextStyle(
              color: AppTheme.hintTextColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500
          ),
          validate: (val) =>validator(val,
              AppStrings.passwordValidation,
              val!.isEmpty ),
        ),
      ],
    );
  }
}
