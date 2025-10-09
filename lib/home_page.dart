import 'package:flutter/material.dart';
import 'package:flutter_app/components_widget.dart';
import 'package:flutter_app/gpt_page.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController dateInputController = TextEditingController();
DateTime? _selectedDate;

class _HomePageState extends State<HomePage> {
  
int amountApps=0;  

var dateFormatter = new MaskTextInputFormatter(
mask: '##/##/####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var cellfoneFormatter = new MaskTextInputFormatter(
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
void initState() {
    super.initState();
    getAllInstalledApps();
  }

   getAllInstalledApps() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(false,true);
    setState(() {
      int amountApps = apps.length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return 
      customAppBar('Home Page',
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Nome Completo'),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    inputFormatters: [cpfFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('CPF'),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    inputFormatters: [cellfoneFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Telefone'),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dateInputController,
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
                          dateInputController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                        });
                      }
                    },
                          ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    inputFormatters: [cellfoneFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Telefone'),
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        ) 
      )
      )
      ;
  }
}
