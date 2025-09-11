import 'package:flutter/material.dart';
import 'app_controller.dart';

//Widget dinâmico que retorna a página
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() {
  return HomePageState();
  }

}

//Stado do widget dinâmico
class HomePageState extends State<HomePage>{
  
  @override
  Widget build(BuildContext context) {
  
  return Scaffold(

    appBar: AppBar(
      title: Text('Home Page',style: TextStyle(color:AppController.instance.isDarkTheme ?Colors.white:Colors.black),),
      backgroundColor: Colors.purple,
      actions: [ThemeButtom()],
    ),


    body:
        Center(
          
        ),



    
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
        child: AppController.instance.isDarkTheme ?  Icon(Icons.light_mode, color: Colors.white,):  Icon(Icons.dark_mode, color: Colors.black,),
      );  
  }

}

