import 'package:flutter/material.dart';
import 'package:smart_attendance_app/ui_helper.dart';
import 'package:smart_attendance_app/view/authentication_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                "Welcome  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/attendance-logo.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Row(
                children: [
                  UiHelper.CustomButton(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AutenticationView()));
                  }, "Start Day")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
