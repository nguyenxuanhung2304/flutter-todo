import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todo/constants.dart' as constants;

class SharedPreferencesHelper {
  static Future<bool> getViewedWelcomePage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(constants.viewedWelcomePage) ?? false;
  }

  static Future<bool> setViewedWelcomePage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(constants.viewedWelcomePage, true);
  }
}
