import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {

      final TextEditingController _loginController = TextEditingController();
      final TextEditingController _senhaController = TextEditingController();
      String _responseText = "";

      Future<void> _sendData() async {
        final login = _loginController.text;
        final senha = _senhaController.text;
        final url = Uri.http('127.0.0.1:5000','/responsavel',);
        final request = http.Request('GET', url)
          ..headers['Content-Type'] = 'aplication/json'
          ..body = jsonEncode({'id_resp': login,'senha': senha});

        try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            setState(() {
              _responseText = "✅ Success: ${data['token']}";
            });
          } else {
            setState(() {
              _responseText =
                  "❌ Error ${response.statusCode}: ${response.body}";
            });
          }
        } catch (e) {
          setState(() {
            _responseText = "⚠️ Request failed: $e";
          });
        }
      }

    return Scaffold(
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
                child: Image(image: AssetImage('../assets/images/vivo_logo.png'))
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
              Padding(padding: const EdgeInsets.all(8.0),
              child: Text(_responseText, style: TextStyle(color: Colors.red),),
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
                print(_responseText);
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