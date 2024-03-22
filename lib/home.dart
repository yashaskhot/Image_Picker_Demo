// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  File? image;
  Future<dynamic> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("error :$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Image Picker App')),

        ),
        body: Column(children: [
          SizedBox(
            height: 100,
          ),

          Center(
            child: image != null
                ? Image.file(image!, height: 160, width: 160, fit: BoxFit.fill)
                : FlutterLogo(size: 160),
          ),
          Text(
            'Developed by Yashas Khot - Pradhanmantri bae dilao yojana laabarthi',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 30.0),
          TextButton.icon(
              onPressed: () => pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt_outlined),
              label: Text('pick with camera')),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () => pickImage(ImageSource.gallery),
              icon: Icon(
                Icons.browse_gallery_sharp,
              ),
              label: Text('pick from gallery'))
        ]));

  }
}
