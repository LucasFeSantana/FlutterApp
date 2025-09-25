import 'package:flutter/material.dart';
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
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _apps.map((app) {
                  return GestureDetector(
                    onTap: () {
                      // launch the app
                      if (app.packageName != null) {
                        SelectedApp.instance.ChoseApp(app.packageName.toString(),app.appName.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AppDetailsPage()),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 250,
                        height: 80,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: app.iconBytes != null
                                  ? Image.memory(
                                      app.iconBytes!,
                                      width: 60,
                                      height: 60,
                                    )
                                  : Icon(Icons.android, size: 60),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 170,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Aplication: ${app.appName ?? ''}",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text("Install Date: ${DateFormat('MMM d, y').format(DateTime.parse(app.firstInstallTime.toString())) ?? ''}",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text("Update Date: ${DateFormat('MMM d, y').format(DateTime.parse(app.lastUpdateTime.toString())) ?? ''}",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
