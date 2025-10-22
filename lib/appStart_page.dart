import 'package:flutter/material.dart';
import 'package:flutter_app/gpt_page.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/login_page.dart';
import 'app_controller.dart';


class AppStartPage extends StatefulWidget {
  @override
  _AppStartPageState createState() => _AppStartPageState();
}

class _AppStartPageState extends State<AppStartPage> {

  @override
  void initState() {
    super.initState();

    //Espera 3 segundos com o Logo da Vivo
    Future.delayed(Duration(seconds: 3), () {
      if (AppController.instance.islogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InstalledAppsGallery()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/vivo_logo.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}