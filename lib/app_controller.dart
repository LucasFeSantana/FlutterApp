import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  bool isDarkTheme = false;

  ChangeTheme(){
    isDarkTheme = !isDarkTheme;
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

