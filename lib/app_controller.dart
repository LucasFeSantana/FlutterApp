import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();
  bool isDarkTheme = false;
  bool islogged = true;// Validar de acordo com usuário
  String userEmail = '';
  final String ipServidor = '192.168.250.112';

  checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    islogged = prefs.getBool('isLogged')??false;
    notifyListeners();
  }

  ChangeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  //Loga e desloga o usuário e registra dado localmente
  Future<void> UserLogging(String email) async {
    final prefs = await SharedPreferences.getInstance();
    islogged = !islogged;
    if (islogged){userEmail=email;}else{userEmail='';}
    prefs.setBool('isLogged', islogged);
    prefs.setString('userEmail', userEmail);
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

