import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// App Links //
class AppLinks {
  static String get backgroundImage => 'assets/images/background.jpg';
  static String get homeBackgroundImage => 'assets/images/homebackground.jpg';
  static String get personImage => 'assets/images/person.png';
  static String get arrowUpIcon => 'assets/icons/arrowUp.png';
  static String get arrowBackIcon => 'assets/icons/arrowBack.png';
  static String get galleryIcon => 'assets/icons/gallery.png';
  static String get cameraIcon => 'assets/icons/camera.png';
}

// App Strings //

class AppStrings {
  static String get login => 'LOG IN';
  static String get welcome => 'Welcome';
  static String get my => 'My';
  static String get gallery => 'Gallery';
  static String get camera => 'Camera';
  static String get userName => 'User Name';
  static String get userNameValidation => 'Please Enter Correct username';
  static String get password => 'Password';
  static String get passwordValidation => 'Please Enter Correct password';
  static String get submit => 'SUBMIT';
  static String get successfullyLoggedIn => 'Successfully logged in';
  static String get logOut => 'Log Out';
  static String get upload => 'Upload';
}

// App Size //

class AppSize {

  // App Constant Height //

  static double get h => ScreenUtil.defaultSize.height.h;
  static double get h5 => 5.h;
  static double get h2 => 2.5.h;
  static double get h10 => 10.h;
  static double get h12 => 12.5.h;
  static double get h15 => 15.h;
  static double get h17 => 17.5.h;
  static double get h20 => 20.h;
  static double get h22 => 22.h;
  static double get h25 => 25.h;
  static double get h30 => 30.h;
  static double get h35 => 35.h;
  static double get h40 => 40.h;
  static double get h44 => 44.h;
  static double get h45 => 45.h;
  static double get h48 => 48.h;
  static double get h50 => 50.h;
  static double get h55 => 55.h;
  static double get h60 => 60.h;
  static double get h65 => 65.h;
  static double get h70 => 70.h;
  static double get h72 => 72.h;
  static double get h75 => 75.h;
  static double get h80 => 80.h;

// App Constant Width //

  static double get w => ScreenUtil.defaultSize.width.w;
  static double get w5 => 5.w;
  static double get w2 => 2.5.w;
  static double get w10 => 10.w;
  static double get w12 => 12.5.w;
  static double get w15 => 15.w;
  static double get w17 => 17.5.w;
  static double get w20 => 20.w;
  static double get w22 => 22.w;
  static double get w25 => 25.w;
  static double get w30 => 30.w;
  static double get w35 => 35.w;
  static double get w40 => 40.w;
  static double get w45 => 45.w;
  static double get w48 => 48.w;
  static double get w50 => 50.w;
  static double get w55 => 55.w;
  static double get w60 => 60.w;
  static double get w65 => 65.w;
  static double get w70 => 70.w;
  static double get w72 => 72.w;
  static double get w75 => 75.w;
  static double get w80 => 80.w;
}

// App SizedBox //

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}