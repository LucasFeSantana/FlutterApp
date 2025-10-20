import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _responseText = "";
  @override
  Widget build(BuildContext context) {

      final TextEditingController _loginController = TextEditingController();
      final TextEditingController _senhaController = TextEditingController();


      Future<void> _sendData() async {
        final login = _loginController.text;
        final senha = _senhaController.text;
        final url = Uri.http('10.0.2.2:5000','/responsavel',{
          'login': login,
          'senha': senha
          });

        final request = http.Request('GET', url);

        try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            setState(() {
              _responseText = "✅ Login realizado com sucesso";
              print(_responseText);
            });
          } else {
            setState(() {
              _responseText =
                  "${jsonDecode(response.body)["falha"]}";
                  print(_responseText);
            });
          }
        } catch (e) {
          setState(() {
            _responseText = "⚠️ Request failed: $e";
            print(_responseText);
          });
        }
      }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
        
          //padding global da página
          padding: const EdgeInsets.all(16.0),
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
                  width:250,height: 131,
                child:
                  Center(
                    child: Column(children:[
                      Text("Bem-vindo(a) ao App",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Color.fromARGB(255, 102, 102, 102),fontFamily: "Vivo Type")),
                      Text("Segurança Digital para Pequenos Gigantes",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Color.fromARGB(255, 102, 0, 153),fontFamily: "Vivo Type"))
                      ]
                      ),
                  ),
                ),
                    
                SizedBox(height: 30),
                    
                SizedBox(
                  width:305,height: 26,
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
                    
                SizedBox(height: 8),
                    
                SizedBox(
                  width:305,height: 40,
                child:
                  Center(
                    child: Column(children:[
                    
                      Text("Configure controles parentais inteligentes em menos de 5 minutos",
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
          
                SizedBox(height: 32),
          
                //Caixa de e-mail para validação da conta
                Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(width: 305,
                  child: TextField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('E-mail'),
                    ),
                  ),
                ),
              ),

              //Caixa de senha
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(width: 305,
                  child: TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Senha'),
                    ),
                  ),
                ),
              ),

              //Info sobre validação do login
              SizedBox(
                height: 50,
                width: 305,
                child: Padding(padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: Text(_responseText, style: TextStyle(color: Colors.red),textAlign: TextAlign.left,),
                ),
              )
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child:ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 102, 0, 153)),
              onPressed: (){
                _sendData();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Próximo",style: TextStyle(color: Colors.white),),
              ),
              
            ),
        ),
    );
  }
}