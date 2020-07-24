import 'package:FIREBASE/OUTSCREEN.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class Login_screen extends StatefulWidget {
  static const id = "login_screen";
  @override
  _Login_screenState createState() => _Login_screenState();
}

// ignore: camel_case_types
class _Login_screenState extends State<Login_screen> {
  // AnimationController controller;
  // Animation animation;
  final _auth = FirebaseAuth.instance;

  var email = TextEditingController();
  var pass = TextEditingController();
  var out = "Login Succesfully";
  var title = "SUCCESS";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "img",
              child: Container(
                child: Image.asset(
                  "images/brother.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            TypewriterAnimatedTextKit(
                text: ["LOGIN HERE"],
                isRepeatingAnimation: false,
                speed: Duration(seconds: 1),
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart),
            TextField(
              textAlign: TextAlign.center,
              controller: email,
              // maxLength: 20,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: pass,
              maxLength: 10,
              decoration: InputDecoration(hintText: "PASSWORD"),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () async {
                try {
                  final log_in = await _auth.signInWithEmailAndPassword(
                      email: email.text.trim(), password: pass.text);
                  if (log_in != null) {
                    Navigator.pushNamed(context, OutPut.id);
                    var out = "Login Succesfully";
                    var title = "SUCCESS";
                    return Alert(
                      context: context,
                      title: title,
                      content: Text(out),
                      closeFunction: () {},
                    ).show();
                  }
                } catch (e) {
                  print(e.code);
                  if (e.code == "ERROR_WRONG_PASSWORD") {
                    title = "WRONG PASSWORD";
                    out = "enter correct password";
                  } else if (e.code == "ERROR_USER_NOT_FOUND") {
                    title = "USER NOT FOUND";
                    out = "Incorrect email address";
                  } else {}
                  return Alert(
                    context: context,
                    title: title,
                    content: Text(out),
                    closeFunction: () {},
                  ).show();
                }
              },
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text buildText() {
  //   return Text(
  //             "LOGIN",
  //             style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
  //           );
  // }
}
