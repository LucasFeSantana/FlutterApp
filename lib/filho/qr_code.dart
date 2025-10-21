

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AndroidQrCodeWidget extends StatefulWidget{
  const AndroidQrCodeWidget({Key? key}) : super(key: key);

  @override
  State<AndroidQrCodeWidget> createState() => _AndroidQrCodeWidgetState();


  
}

class _AndroidQrCodeWidgetState extends State<AndroidQrCodeWidget>{
  String? androidId;

  @override
  void initState() {
    super.initState();
    _getAndroidId();
  }

  Future<void> _getAndroidId() async{
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    setState(() {
      androidId = androidInfo.id;
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: androidId == null
      ? const CircularProgressIndicator()
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ID: ${androidId}"),
          SizedBox(height: 20),
          QrImageView(
            data: androidId!,
            version: QrVersions.auto,
            embeddedImage: AssetImage('assets/images/vivo_logo.png'),
            embeddedImageStyle: QrEmbeddedImageStyle(size: Size(50, 50)),
            size: 200)
        ],
      ),
    );
  }
}