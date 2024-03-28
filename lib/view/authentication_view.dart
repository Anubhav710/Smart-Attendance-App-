import 'package:flutter/material.dart';
import 'package:smart_attendance_app/ui_helper.dart';
import 'package:smart_attendance_app/view/login_view.dart';

class AutenticationView extends StatefulWidget {
  const AutenticationView({super.key});

  @override
  State<AutenticationView> createState() => _AutenticationViewState();
}

class _AutenticationViewState extends State<AutenticationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Fingerprint Recognition ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Facial Recognition ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Text(
              "We're working hard to bring you a great experience. Stay tuned for the launch! App is in Under Development.... "),
          Container(
            child: UiHelper.CustomButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()));
            }, "LogOut"),
          )
        ],
      ),
    );
  }
}
