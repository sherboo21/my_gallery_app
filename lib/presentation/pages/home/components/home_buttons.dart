import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button.dart';

class HomeButtons extends StatelessWidget {
  final Function() uploadFunction;
  const HomeButtons({Key? key, required this.uploadFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.w40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context , index) =>CustomButton(
          background: Colors.white,
          radius: 16,
          width: 142.w,
          height: 39.3.h,
          onTap: index == 0 ?
          (){} :
           uploadFunction,
          child: Center(
            child: Row(
              children: [
                Container(
                  height: 28.h,
                  width: AppSize.w30,
                  decoration: BoxDecoration(
                      color: index == 0 ?
                     const Color(0xFFF14B48) : const Color(0xFFF99C07),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow:  [
                        BoxShadow(
                            color: index == 0 ?
                            Colors.red  :Colors.orange,
                            blurRadius: 10,
                            offset: const Offset(0 , 0)
                        ),
                        BoxShadow(
                            color: index == 0 ?
                            Colors.red  :Colors.orange,
                            offset: const Offset(5 , 0)
                        ),
                      ]
                  ),
                  child:  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(
                        left: 4.w
                      ),
                      child: Image.asset(
                        index == 0 ?
                        AppLinks.arrowBackIcon : AppLinks.arrowUpIcon,
                        fit: BoxFit.fill,
                        color: Colors.white,
                        height: AppSize.h15,
                        width: AppSize.w15,
                      )
                    ),
                  ),
                ),
                AppSize.w20.pw,
                Text(
                  index == 0 ?
                  AppStrings.logOut : AppStrings.upload,
                  style: TextStyle(
                      color: AppTheme.textColor
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context , index) =>AppSize.w30.pw,
      ),
    );
  }
}
