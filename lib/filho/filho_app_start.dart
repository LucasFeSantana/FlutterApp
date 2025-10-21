
import 'package:flutter/material.dart';
import 'package:flutter_app/filho/qr_code.dart';

class FilhoAppStart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //logo Vivo
                  SizedBox(
                    width:48, height: 48,
                  child: Image(image: AssetImage('assets/images/vivo_logo.png'))
                  ),
                      
                  SizedBox(height: 20,),
                      
                  SizedBox(
                    width:250,height: 145,
                  child:
                    Center(
                      child: Column(children:[
                        Text("Bem-vindo(a) ao App",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Color.fromARGB(255, 102, 102, 102),fontFamily: "Vivo Type")),
                        Text("Segurança Digital para Pequenos Gigantes",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Color.fromARGB(255, 102, 0, 153),fontFamily: "Vivo Type")),

                        ]
                        ),
                    ),
                  ),
                  SizedBox(
                  width:310,height: 30,
                child:
                  Center(
                    child: Column(children:[
                    
                      Text("Proteja sua família com simplicidade",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                          ,color: Color.fromARGB(255, 0, 0, 0)
                          ,fontFamily: "Vivo Type"
                        )
                      ),
                    ])
                  )
                ),
                    
                SizedBox(height: 10),
                    
                SizedBox(
                  width:305,height: 50,
                child:
                  Center(
                    child: Column(children:[
                    
                      Text("Escanei o Qr code para registrar o aparelho do seu filho.",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                          ,color: Color.fromARGB(255, 102, 102, 102)
                          ,fontFamily: "Vivo Type"
                        )
                      ),
                    ])
                  )
                ),
                AndroidQrCodeWidget()
              ],
          ),)
        ),
      
      )
    );
  }
}