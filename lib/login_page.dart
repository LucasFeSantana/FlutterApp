import 'package:flutter/material.dart';
import 'package:flutter_app/components_widget.dart';
import 'app_controller.dart';

//Widget dinâmico que retorna a página
class LoginPage extends StatefulWidget{

  @override
  State<LoginPage> createState() {
  return LoginPageState();
  }

}

//Stado do widget dinâmico
class LoginPageState extends State<LoginPage>{
  
  @override
  Widget build(BuildContext context) {
  
  return 

    customAppBar('Login', 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration( border: OutlineInputBorder(),labelText: 'Email'),
              ),
          ],
          ),
        ),
      )
    );

  }
}
