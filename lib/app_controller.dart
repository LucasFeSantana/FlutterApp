import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  bool isDarkTheme = false;
  bool islogged = false;
  String userEmail = '';

  ChangeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
  UserLogging(String email){
    islogged = true;
    userEmail = email;
    notifyListeners();
  }
}

class SelectedApp extends ChangeNotifier {

  static SelectedApp instance = SelectedApp();

  String packageName ='';
  String appName ='';
  
  ChoseApp(String packageName, String appName){
    instance.packageName= packageName;
    instance.appName= appName;
    notifyListeners();
  }

  UnselectApp(){
    instance.packageName='';
    notifyListeners();
  }

}

