import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_attendance_app/ui_helper.dart';

import 'package:smart_attendance_app/view/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // it handle the input field
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Created Sign Up function
  signUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomAlertBox(context, "Enter Requied Fields");
    } else {
      UserCredential? usercredential;

      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((value) => Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginView())));
      } on FirebaseAuthException catch (e) {
        return UiHelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SignUp Page",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/signup.webp"),
              UiHelper.CustonTextField(
                  emailController, "Email", Icons.mail, false),
              UiHelper.CustonTextField(
                  passwordController, "Password", Icons.password, true),
              const SizedBox(height: 30),
              UiHelper.CustomButton(() {
                signUp(emailController.text.toString(),
                    passwordController.text.toString());
              }, "SignUp"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
