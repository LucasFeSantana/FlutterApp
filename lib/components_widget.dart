import 'package:flutter/material.dart';
import 'package:flutter_app/app_controller.dart';

class customAppBar extends StatelessWidget {

  //Propriedades do Scafold personalizado
  final String title;
  final dynamic body;
  dynamic button=null;

  customAppBar(String this.title, this.body,{this.button});
  @override
  Widget build(BuildContext context) {
  return
    Scaffold(
      appBar: AppBar(
          title: Text(title,style: TextStyle(color: AppController.instance.isDarkTheme? Color.fromARGB(255, 238, 238,238) : Colors.black,)),
          actions: [
            ThemeButtom()
          ],
        ),
      body: Column(children: [Divider(thickness:1.7, color:AppController.instance.isDarkTheme ? Color.fromARGB(255, 37, 37, 37) :Color.fromARGB(255, 221, 221, 221)),body],),
      floatingActionButton: button ??  button,
    );
  }
}


class ThemeButtom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      FloatingActionButton(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        onPressed: () {
          AppController.instance.ChangeTheme();
        },
        child: AppController.instance.isDarkTheme ?  Icon(Icons.light_mode, color: Color.fromARGB(255, 238, 238, 238),):  Icon(Icons.dark_mode, color: Colors.black,),
      );
  }
}

