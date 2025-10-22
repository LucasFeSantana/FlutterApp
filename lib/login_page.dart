import 'package:flutter/material.dart';
import 'package:flutter_app/appStart_page.dart';
import 'package:flutter_app/singup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _appStartPageState();
}

class _appStartPageState extends State<LoginPage> {
  String _responseText = "";
  bool _hiddenPassword = true;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      Future<void> _sendData() async {
        final login = _loginController.text;
        final senha = _senhaController.text;
        final url = Uri.http('192.168.1.6:5000','/responsavel',{
          'login': login,
          'senha': senha
          });

        final request = http.Request('GET', url);

        try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

          if (response.statusCode == 200) {
            setState(() {
              AppController.instance.UserLogging(login);
              Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AppStartPage()),
                      );
            });
          } else {
            setState(() {
              _responseText =
                  "${jsonDecode(response.body)["falha"]}";
                  print(AppController.instance.islogged);
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
                  width:305,height: 52,
                child:
                  Center(
                    child: Column(children:[
                    
                      Text("Proteja sua família com simplicidade",
                        overflow: TextOverflow.clip,
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
                    keyboardType: TextInputType.emailAddress,
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
                    obscureText: _hiddenPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Senha'),
                      suffixIcon:
                        IconButton(
                          onPressed:() {
                            setState(() {
                            _hiddenPassword = !_hiddenPassword;
                          });
                          },
                          icon: Icon(_hiddenPassword?Icons.visibility_off:Icons.visibility))
                    ),
                    
                  ),
                ),
              ),

              //Info sobre validação do login
              SizedBox(
                height: _responseText.isEmpty?0:30,
                width: 305,
                child: Padding(padding: const EdgeInsets.fromLTRB(0,4,0,8),
                  child: Text(_responseText, style: TextStyle(color:Colors.red),textAlign: TextAlign.left,),
                ),
              ),

              //Redirect para cadastro
              SizedBox(
                child: Padding(padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: GestureDetector(
                    onTap:() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SingupPage()),
                      );
                    },
                    child: Text('Criar Conta', style: TextStyle(decoration:TextDecoration.underline,color: Color.fromARGB(255, 102, 102, 102)),textAlign: TextAlign.center,)),
                ),
              ),

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