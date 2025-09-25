import 'package:flutter/material.dart';
import 'package:flutter_app/components_widget.dart';
import 'package:flutter_app/gpt_page.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
int amountApps=0;  

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
        child: Container(
        )
      ),
      button: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InstalledAppsGallery()));
        }
        ),
      )
      ;
  }
}
