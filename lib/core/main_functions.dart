import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../config/theme/app_theme.dart';
import 'constants.dart';


// Show Notification Toast //

customNotificationToast({
  required BuildContext context,
  required String content,
  required Color color,
}){
  return showToastWidget(
    Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.w15,
              vertical: AppSize.w12
          ),
          decoration: BoxDecoration(
            color: color,
          ),
          child:  Center(
            child: Text(
              content,
              style:  TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp
              ),
            ),
          ),
        ),
      ],
    ),
    context: context,
    isIgnoring: true,
    position: StyledToastPosition.top,
    animation: StyledToastAnimation.slideFromTopFade,
    duration: const Duration(milliseconds: 5000),
  );
}

// Show Alert Dialog //

Future<dynamic> customAlertDialog({
  required BuildContext context,
  required Widget content,
  required DialogType dialogType,
}){
  return AwesomeDialog(
    dialogBackgroundColor: const Color.fromRGBO(225, 225, 255, 0.4),
      borderSide: const BorderSide(
        color: Colors.white
      ),
      dismissOnTouchOutside: true,
      dialogBorderRadius:  BorderRadius.circular(30),
      context: context,
      dialogType: dialogType,
      body: Column(
        children: [
         content,
          AppSize.h30.ph,
        ],
      )
  ).show();
}
