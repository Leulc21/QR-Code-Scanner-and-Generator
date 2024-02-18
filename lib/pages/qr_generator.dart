// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrgenerator extends StatefulWidget {
  const Qrgenerator({Key? key}) : super(key: key);

  @override
  State<Qrgenerator> createState() => _QrgeneratorState();
}

class _QrgeneratorState extends State<Qrgenerator> {
  TextEditingController qrController = TextEditingController();
  String generatedQrCode = "";
  void clearText() {
    setState(() {
      qrController.clear();
      generatedQrCode = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Text("QR Generator"),
        backgroundColor: Colors.deepPurple.shade400,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (generatedQrCode.isNotEmpty)
                QrImageView(data: generatedQrCode, size: 200),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: qrController,
                  decoration: InputDecoration(
                    labelText: "Enter Your data",
                    hintText: "Enter the data to generate a QR code",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (qrController.text.isNotEmpty) {
                        setState(() {
                          generatedQrCode = qrController.text;
                        });
                      }
                    },
                    child: Text("Generate QR"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: clearText,
                    child: Text("Clear"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
