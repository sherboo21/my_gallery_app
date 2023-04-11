import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery_app/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:my_gallery_app/presentation/pages/auth/login/components/login_button.dart';
import 'package:my_gallery_app/presentation/pages/auth/login/components/login_form.dart';
import '../../../../config/routs/named_routs.dart';
import '../../../../config/routs/named_routs_impl.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants.dart';
import '../../../../core/main_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
     listener: (context, state) {
       if(state is LogInSuccessState){
         customNotificationToast(
           context: context,
           color:  AppTheme.notificationSuccessfullyColor,
           content: AppStrings.successfullyLoggedIn,
         );
         var mNamedNavigator = NamedNavigatorImpl();
         mNamedNavigator.push(
             Routes.homeROUTER, replace: true, clean: true
         );
       }
     },
    builder: (context, state) {
       var authCubit = AuthCubit.get(context);
       return Scaffold(
        body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        AppLinks.backgroundImage
                    ),
                    fit: BoxFit.fill
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.my,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp,
                        color: AppTheme.textColor
                    ),
                  ),
                  Text(
                    AppStrings.gallery,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp,
                        color: AppTheme.textColor
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: AppSize.w60
                    ),
                    child: Column(
                      children: [
                        AppSize.h80.ph,
                        LoginForm(
                            userNameController: userNameController,
                            passwordController: passwordController,
                            passwordFocusNode: _passwordFocusNode
                        ),
                        AppSize.h30.ph,
                       state is LogInLoadingState ?
                        Center(
                          child: CupertinoActivityIndicator(
                            radius: 15.r,
                          ),
                        ) : LoginButton(
                         function: (){
                         if(_formKey.currentState!.validate()){
                           authCubit.logIn(
                               email: userNameController.text,
                               password: passwordController.text
                           );
                         }
                       },)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
  },
);
  }
}
