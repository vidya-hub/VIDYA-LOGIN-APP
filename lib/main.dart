import 'package:FIREBASE/OUTSCREEN.dart';
import 'package:FIREBASE/loginscreen.dart';
import 'package:FIREBASE/registrationscreen.dart';
import 'package:FIREBASE/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      initialRoute: MyApp.id,
      routes: {
        MyApp.id: (context) => MyApp(),
        Login_screen.id: (context) => Login_screen(),
        Reg_Screen.id: (context) => Reg_Screen(),
        OutPut.id: (context) => OutPut()
      },
    );
  }
}
