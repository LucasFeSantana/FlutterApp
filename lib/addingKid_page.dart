import 'dart:ffi';
import 'components_widget.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

int _currentStep = 1;
final TextEditingController _nomeCriancaController = TextEditingController();
final TextEditingController _nascimentoCriancaController = TextEditingController();

  changeWidget(){
  switch (_currentStep){
    case 1:
      return Column(children: [SizedBox(
                  width:250,height: 38,
                child:
                  Center(
                    child: Column(children:[
                      Text("Sobre seu filho(a)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Color.fromARGB(255, 102, 0, 153),fontFamily: "Vivo Type"))
                      ]
                      ),
                  ),
                ),SizedBox(height:24),//separador

                SizedBox(
                child:
                  Center(
                    child: Column(children:[
                    
                      Text("Algumas insformações básicas",
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                            ,color: Color.fromARGB(255, 102, 102, 102)
                            ,fontFamily: "Vivo Type"
                          )
                      ),SizedBox(height:24),//separador

                      Steppeer(_currentStep),SizedBox(height:32),//separador

                      SizedBox(
                        width: 328,
                        child: TextField(
                          controller: _nomeCriancaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Nome da criança'),
                          )
                        ),
                      ),SizedBox(height:32),//separador

                      SizedBox(
                        width: 328,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _nascimentoCriancaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Idade'),
                          )
                        ),
                      )

                    ])
                  )
                ),]);
    
    case 2:
    return Container(child: Steppeer(_currentStep),);
    case 3:
    return Container(child: Steppeer(_currentStep),);
    case 4:
    return Container(child: Steppeer(_currentStep),);
    case 5:
    return Container(child: Steppeer(_currentStep),);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
            
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Image(image: AssetImage('./assets/images/vivo_logo.png')),
                ),SizedBox(height: 32,), //Separador

                //Steppeer(_currentStep),

                changeWidget(),
            
              ],
            ),
          ),
        ),
        ),
      bottomNavigationBar: (_currentStep>1)?SizedBox(
        height: 128,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 102, 0, 153)),
                onPressed: (){setState(() {
                if(_currentStep<5){_currentStep++;}
              });}, child: Text('Próximo',style:TextStyle(color:Colors.white))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),
                onPressed: (){setState(() {
                if(_currentStep>1){_currentStep--;}
              });}, child: Text('Anterior',style: TextStyle(color: Color.fromARGB(255, 102, 0, 153),)))
            ],
          ),
        ),
      ):
      SizedBox(
        height: 80,
        width: 220,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 102, 0, 153)),
                onPressed: (){setState(() {
                if(_currentStep<5){_currentStep++;}
              });}, child: Text('Próximo',style:TextStyle(color:Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}