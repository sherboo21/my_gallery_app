import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future startPrefs() async{
  prefs = await SharedPreferences.getInstance();
}