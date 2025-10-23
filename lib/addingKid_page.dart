import 'dart:ffi';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

int _currentStep = 1;

  changeWidget(){
  switch (_currentStep){
    case 1:
      return Column(children: [SizedBox(
                  width:250,height: 36,
                child:
                  Center(
                    child: Column(children:[
                      Text("Sobre seu Filho(a)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Color.fromARGB(255, 102, 0, 153),fontFamily: "Vivo Type"))
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

                        Container(
                          width: 216,
                          height: 24,
                          child: Row(
                            children: [
                              Icon(Icons.circle,color: Color.fromARGB(255, 102, 0, 153),),
                              SizedBox(),
                              Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                              Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
                              SizedBox(),
                            ],
                          ),
                        )
                    ])
                  )
                ),]);
    
    case 2:
    return Container(
      width: 216,
      height: 24,
      child: Row(
        children: [
          Icon(Icons.check_circle,color: Color.fromARGB(255, 102, 0, 153),),
          SizedBox(),
          Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 0, 153),),
          SizedBox(),
          Icon(Icons.circle,color: Color.fromARGB(255, 102, 0, 153),),
          SizedBox(),
          Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
          Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
          Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
          Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
          Icon(Icons.linear_scale_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
          Icon(Icons.circle_outlined,color: Color.fromARGB(255, 102, 102, 102),),
          SizedBox(),
        ],
      ),
    );
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

                changeWidget(),
            
              ],
            ),
          ),
        ),
        ),
      bottomNavigationBar: SizedBox(
        height: 96,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){setState(() {
              if(_currentStep<2){_currentStep++;}
            });}, child: Text('Próximo')),
            ElevatedButton(onPressed: (){setState(() {
              if(_currentStep>1){_currentStep--;}
            });}, child: Text('Anterior'))
          ],
        ),
      ),
    );
  }
}