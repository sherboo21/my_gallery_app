import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery_app/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:my_gallery_app/presentation/pages/home/cubit/home_cubit.dart';
import 'config/routs/named_routs.dart';
import 'config/routs/named_routs_impl.dart';
import 'core/bloc_observer.dart';
import 'core/shared_preferences.dart';
import 'network/remote/dio.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await startPrefs();
  return runApp(
    const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
              create: (context) =>AuthCubit()
          ),
          BlocProvider<HomeCubit>(
              create: (context) =>HomeCubit()
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360 , 812),
          builder: (context , child) =>MaterialApp(
            initialRoute: Routes.loginRouter,
            onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
            navigatorKey: NamedNavigatorImpl.navigatorState,
            debugShowCheckedModeBanner: false,
            title: 'My Gallery',
          ),
        ),
      );
  }
}
