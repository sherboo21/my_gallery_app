class Routes {
  static const loginRouter = "LOGIN_ROUTER";
  static const homeROUTER = "HOME_ROUTER";
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}