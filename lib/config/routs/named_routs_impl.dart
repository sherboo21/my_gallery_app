import 'package:flutter/material.dart';
import 'package:my_gallery_app/presentation/pages/auth/login/login_page.dart';
import 'package:my_gallery_app/presentation/pages/home/home_page.dart';
import 'named_routs.dart';

class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
  GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.loginRouter:
        return MaterialPageRoute(builder: (_) =>  const LoginPage());
      case Routes.homeROUTER:
        return MaterialPageRoute(builder: (_) =>  const HomePage());
    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  @override
  Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments
      );
    }

    if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(
          routeName, arguments: arguments
      );
    }

    return navigatorState.currentState!.pushNamed(
        routeName,
        arguments: arguments
    );
  }
}