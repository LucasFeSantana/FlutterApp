import 'package:flutter/material.dart';
import 'package:flutter_app/appStart_page.dart';
import 'package:flutter_app/app_controller.dart';
import 'package:flutter_app/app_details_page.dart';
import 'package:flutter_device_apps/flutter_device_apps.dart';
import 'package:flutter_app/components_widget.dart';
import 'package:intl/intl.dart';

class InstalledAppsGallery extends StatefulWidget {
  @override
  _InstalledAppsGalleryState createState() => _InstalledAppsGalleryState();
}

class _InstalledAppsGalleryState extends State<InstalledAppsGallery> {
  List<AppInfo> _apps = [];

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  Future<void> _logout() async {
    setState(() {
      AppController.instance.UserLogging('');
      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AppStartPage()),
                      );
    });
    
  }

  Future<void> _loadApps() async {
    List<AppInfo> apps = await FlutterDeviceApps.listApps(
      includeSystem: true,
      onlyLaunchable: true,
      includeIcons: true,
    );

    setState(() {
      _apps = apps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return customAppBar(
      "Installed Apps Gallery",
      _apps.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
            child: ElevatedButton(
              onPressed: () {
                _logout();
              },
              child: Text('Logout'),
            )
          ),
    );
  }
}
