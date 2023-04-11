import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants.dart';
import '../../../../widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  final Function() function;
  const LoginButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        height: AppSize.h45,
        radius: 10.r,
        background: const Color(0xFF7BB3FF),
        onTap: function,
        child: Center(
          child: Text(
            AppStrings.submit,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        )
    );
  }
}
