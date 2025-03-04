import 'package:flutter_login_regsister/features/login/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences=await SharedPreferences.getInstance();
  }

  static void saveLanguage(String language){
    _preferences.setString("language", language);
  }

  static String getLanguage(){
    return _preferences.getString("language")??"en";
  }

  static void saveLoginData(LoginData loginData){
    var data=loginData.data;
    _preferences.setString("token", data.token);
    _preferences.setString("fullname", data.fullname);
  }

  static String getToken(){
    return _preferences.getString("token")??"";
  }

  static String getFullName(){
    return _preferences.getString("fullname")??"";
  }
}