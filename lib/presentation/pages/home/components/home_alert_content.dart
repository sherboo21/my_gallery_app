import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants.dart';


class HomeAlertContent extends StatelessWidget {
   final Function() function;
   final int index;
   const HomeAlertContent({
     Key? key,
     required this.function,
     required this.index
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppSize.w60
        ),
        height: AppSize.h55,
        width: 184.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index == 1 ?
            const Color(0xFFEBF6FF) : const Color(0xFFEFD8F9)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              index == 0 ?
              AppLinks.galleryIcon : AppLinks.cameraIcon,
              fit: BoxFit.fill,
            ),
            index == 0 ?
            AppSize.w10.pw : 0.pw,
            Text(
              index == 0 ?
              AppStrings.gallery : AppStrings.camera,
              style: TextStyle(
                  color: AppTheme.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp
              ),
            )
          ],
        ),
      ),
    );
  }
}
