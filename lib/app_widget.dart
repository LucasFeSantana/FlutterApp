import 'package:flutter/material.dart';
import 'home_page.dart';
import 'app_controller.dart';

class appWidget extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: AppController.instance,

      builder:(context, child) {
        return
        MaterialApp(
          theme: ThemeData(
            brightness: AppController.instance.isDarkTheme ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      },
    );

  }
}