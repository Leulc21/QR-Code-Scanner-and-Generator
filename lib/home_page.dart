// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:your_project_name/pages/qr_generator.dart';
import 'package:your_project_name/pages/qrscanner.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        
        title: Text(
          "QR Code Scanner and Generator",
        ),
        backgroundColor: Colors.deepPurple.shade400,
        elevation: 0.0,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Qr_scanner()));
              },
              child: Text("Scan QR code"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Qrgenerator()));
              },
              child: Text("Generate QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
