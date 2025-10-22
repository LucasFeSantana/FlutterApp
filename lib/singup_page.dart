import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/appStart_page.dart';
import 'dart:convert';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}
bool _hiddenPassword = true;
DateTime? _selectedDate;
String _responseText = "";
final TextEditingController _loginController = TextEditingController();
final TextEditingController _senhaController = TextEditingController();
final TextEditingController _confirmacaoSenhaController = TextEditingController();
final TextEditingController _nomeController = TextEditingController();
final TextEditingController _cpfController = TextEditingController();
final TextEditingController _telefoneController = TextEditingController();
final TextEditingController _nascimentoController = TextEditingController();

class _SingupPageState extends State<SingupPage> {

Future<void> _sendData() async {
        final login = _loginController.text;
        final senha = _senhaController.text;
        final nome = _nomeController.text;
        final nascimento = _nascimentoController.text;
        final telefone = _telefoneController.text;
        final cpf = _cpfController.text;
        final url = Uri.http('192.168.1.6:5000','/responsavel');

        try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
          "id_resp": "ID_3",
          "login": login,
          "senha": senha,
          "nome": nome,
          "email": login,
          "cpf": cpf,
          "telefone": telefone,
          "data_nasc": nascimento,
        }),

        );

          if (response.statusCode == 201) {
            setState(() {
              Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AppStartPage()),
                      );
            });
          } else {
            setState(() {
              _responseText =
                  "${jsonDecode(response.body)["falha"]}";
            });
          }
        } catch (e) {
          setState(() {
            _responseText = "⚠️ Request failed: $e";
            print(_responseText);
          });
        }
      }

  bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

  var dateFormatter = new MaskTextInputFormatter(
mask: '##/##/####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var telefoneFormatter = new MaskTextInputFormatter(
mask: '(##) #####-####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var cpfFormatter = new MaskTextInputFormatter(
mask: '###.###.###-##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,64,16,16),//Padding Global da tela
          child: Center(
            child: Column(
              children: [
                //Componentes da tela
                
                //logo Vivo
                SizedBox(
                  width:48, height: 48,
                child: Image(image: AssetImage('assets/images/vivo_logo.png'))
                ),SizedBox(height: 20,), //Separador

                //Título Topo da Página
                SizedBox(
                  width:250,height: 64,
                child:
                  Center(
                    child: Column(children:[
                      Text("Sobre você",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Color.fromARGB(255, 102, 0, 153),fontFamily: "Vivo Type")),
                      Text("Algumas informações básicas",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color: Color.fromARGB(255, 102, 102, 102),fontFamily: "Vivo Type")),

                      ]
                      ),
                  ),
                ),SizedBox(height: 32),

                //Nome Completo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 305,
                    child: TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Nome Completo'),
                      ),
                    ),
                  ),
                ),

                //CPF
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 305,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _cpfController,
                      inputFormatters: [cpfFormatter],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('CPF'),
                      ),
                    ),
                  ),
                ),

                //Telefone
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 305,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _telefoneController,
                      inputFormatters: [telefoneFormatter],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Telefone'),
                      ),
                    ),
                  ),
                ),

                //Data de Nascimento
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 305,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _nascimentoController,
                      inputFormatters: [dateFormatter],
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1950), // Set your desired first selectable date
                          lastDate: DateTime.now(),  // Set your desired last selectable date
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _nascimentoController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                          });
                        }
                      },
                    ),
                  ),
                ),

                //Caixa de e-mail
                Padding(
                padding: const EdgeInsets.all(8.0),
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

              //Senha
              Padding(
                padding: const EdgeInsets.all(8.0),
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

              //Confirmação da senha
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(width: 305,
                  child: TextField(
                    controller: _confirmacaoSenhaController,
                    obscureText: _hiddenPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Confirme sua senha'),
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


              ],
            ),
          ),
          
        )
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child:ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 102, 0, 153)),
              onPressed: () {
                final email = _loginController.text.trim();
                if (_nomeController.text.isEmpty || _cpfController.text.isEmpty || _telefoneController.text.isEmpty || _nascimentoController.text.isEmpty || _loginController.text.isEmpty || _senhaController.text.isEmpty || _confirmacaoSenhaController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Todos os campos devem ser preenchidos")),
                  );
                  return;
                }
                if (!isValidEmail(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Insira um e-mail válido")),
                  );
                  return;
                }
                if (_senhaController.text!=_confirmacaoSenhaController.text){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("As senhas não coincidem")),
                  );
                  return;
                }
                else{
                  _sendData();
                }
                print("✅ Email is valid!");
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_responseText)),
                  );
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