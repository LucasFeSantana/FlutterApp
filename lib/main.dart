import 'package:flutter/material.dart';

main(){
  runApp(StaticHomeWidget(nome: 'Lucas'));
}

class StaticHomeWidget extends StatelessWidget{

  final nome;

  const StaticHomeWidget({super.key, this.nome});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          this.nome,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.purple,fontSize: 23),
          ),
      ),
    );
  }
  
}