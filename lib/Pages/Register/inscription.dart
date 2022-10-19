import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rapidos/Helpers/utils.dart';
import 'package:rapidos/Theme/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  File? _profilePicFile;
  var _image;
  final picker = ImagePicker();

  Future getImage(int position) async {
    PickedFile? pickedFile;
    if (position == 0) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if (pickedFile != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimaryBlue,
        title: const Text(
          "Inscription",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
