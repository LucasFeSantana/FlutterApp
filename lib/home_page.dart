import 'package:flutter/material.dart';
import 'package:flutter_app/addingKid_page.dart';
import 'package:flutter_app/appStart_page.dart';
import 'package:flutter_app/app_controller.dart';
import 'package:flutter_app/app_details_page.dart';
import 'package:flutter_device_apps/flutter_device_apps.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<AppInfo> _apps = [];

  //@override
  //void initState() {
  //  super.initState();
  //  _loadApps();
  //}

  Future<void> _logout() async {
    setState(() {
      AppController.instance.UserLogging('');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppStartPage()),
      );
    });
    
  }

  //Future<void> _loadApps() async {
  //  List<AppInfo> apps = await FlutterDeviceApps.listApps(
  //    includeSystem: true,
  //    onlyLaunchable: true,
  //    includeIcons: true,
  //  );
  //
  //  setState(() {
  //    _apps = apps;
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Corpo HomePage
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16, 64, 16, 16),
        child: SingleChildScrollView(
          child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyWidget())
                            );
                          },
                          child: Text('Cadastrar Filho')
                        )
                      ],
                    ),
                  ),
                ),
        ),
    ),

      //Navbar inferior
      bottomNavigationBar: ElevatedButton(
                  onPressed: () {
                    _logout();
                  },
                  child: Text('Logout'),
                ),
    );
  }
}
