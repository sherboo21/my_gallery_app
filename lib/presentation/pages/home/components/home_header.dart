import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants.dart';
import '../../auth/cubit/auth_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.w20,
          vertical: AppSize.h20
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          var authCubit =  AuthCubit.get(context);
          var userDataModel = authCubit.userDataModel.user;
          return Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSize.h10
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.welcome,
                        style: TextStyle(
                            color: AppTheme.textColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                        state is! LogInLoadingState && userDataModel != null ?
                        userDataModel.name! : '',
                        style: TextStyle(
                            color: AppTheme.textColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  )
                ),
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    AppLinks.personImage,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
