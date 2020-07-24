import 'package:FIREBASE/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class Reg_Screen extends StatefulWidget {
  static const id = "reg_screen";
  @override
  _Reg_ScreenState createState() => _Reg_ScreenState();
}

// ignore: camel_case_types
class _Reg_ScreenState extends State<Reg_Screen> {
  var name = TextEditingController();
  var pass = TextEditingController();
  var pass_c = TextEditingController();
  var out = "Registration succesfully";
  var title = "";
  var email = TextEditingController();
  bool show = false;

  final _auth = FirebaseAuth.instance;
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
                height: 100,
                width: 100,
                child: Image.asset("images/brother.png"),
              ),
            ),
            Text("REGISTRATION",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            TextField(
              textAlign: TextAlign.center,
              controller: email,
              keyboardType: TextInputType.emailAddress,
              // maxLength: 10,
              decoration: InputDecoration(hintText: "EMAIL"),
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              controller: pass,
              maxLength: 10,
              decoration: InputDecoration(hintText: "PASSWORD"),
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              controller: pass_c,
              maxLength: 10,
              decoration: InputDecoration(hintText: "CONFIRM PASSWORD"),
            ),
            RaisedButton(
              // ignore: missing_return
              onPressed: () async {
                if (pass.text != pass_c.text) {
                  title = "unmatched password";
                  out = "passwords not matched";
                  return Alert(
                    title: title,
                    context: context,
                    content: Text(out),
                  ).show();
                }
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                      email: email.text, password: pass.text);
                  if (user != null && pass.text == pass_c.text) {
                    title = "Successfully Registered";
                    out="";
                    Navigator.pushNamed(context, Login_screen.id);
                    return Alert(
                      context: context,
                      title: title,
                      content: Text(out),
                    ).show();
                    
                  }
                } catch (e) {
                  print(e.code);
                  if (e.code == "ERROR_INVALID_EMAIL") {
                    title = "INVALID EMAIL";
                    out = "enter email in correct format";
                  } else if (e.code == "ERROR_WEAK_PASSWORD") {
                    title = "WEAK PASSWORD";
                    out = "pasword length should be greater than 6";
                  } else if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
                    title = "EMAIL ALREADY IN USE";
                    out = "entered email is already registerd";
                  }
                  return Alert(
                    context: context,
                    title: title,
                    content: Text(out),
                    closeFunction: () {},
                  ).show();
                }
              },
              child: Text(
                "REGISTER",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
