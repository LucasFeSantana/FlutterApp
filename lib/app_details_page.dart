import 'package:flutter/material.dart';
import 'package:flutter_app/components_widget.dart';
import 'package:flutter_device_apps/flutter_device_apps.dart';
import 'app_controller.dart';

class AppDetailsPage extends StatelessWidget {

  var app = FlutterDeviceApps.getApp(SelectedApp.instance.packageName,includeIcon: true);

  @override
  Widget build(BuildContext context) {
    return customAppBar(SelectedApp.instance.appName,Container());
  }
}