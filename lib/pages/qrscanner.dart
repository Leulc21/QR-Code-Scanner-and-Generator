// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_scanner extends StatefulWidget {
  const Qr_scanner({Key? key}) : super(key: key);

  @override
  State<Qr_scanner> createState() => _Qr_scannerState();
}

class _Qr_scannerState extends State<Qr_scanner> {
  String qr_result = "Scanned data will be appear";

  Future<void> scanqr() async {
    try {
      final String result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      
      if (!mounted) return; // Check if the widget is still mounted before updating the state.

      setState(() {
        qr_result = result;
      });
    } on PlatformException {
      setState(() {
        qr_result = "Failed to scan QR code";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
       
        title: Text("QR Scanner"),
        backgroundColor: Colors.deepPurple.shade400,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text('$qr_result', style: TextStyle(color: Colors.black87)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: scanqr,
              child: Text("Scan Code"),
            ),
          ],
        ),
      ),
    );
  }
}
