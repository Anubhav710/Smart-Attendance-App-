import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_attendance_app/ui_helper.dart';
import 'package:smart_attendance_app/view/home_view.dart';
import 'package:smart_attendance_app/view/login_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_attendance_app/view/map_view.dart';

class AutenticationView extends StatefulWidget {
  const AutenticationView({super.key});

  @override
  State<AutenticationView> createState() => _AutenticationViewState();
}

class _AutenticationViewState extends State<AutenticationView> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);

    setState(() {
      this._image = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Text(
                "Start Day",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            const Text(
              "Biometric Authentication",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: getImage,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://images3.alphacoders.com/165/thumb-1920-165265.jpg"),
                  ),
                )
              ],
            ),
            Container(
              child: UiHelper.CustomButton(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Location()));
              }, "Next"),
            )
          ],
        ),
      ),
    );
  }
}
