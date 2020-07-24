import 'package:FIREBASE/components/buttons.dart';
import 'package:FIREBASE/loginscreen.dart';
import 'package:FIREBASE/registrationscreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static const id = "welcome_screen";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller_2;

  Animation animation;
  Animation animation_2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, lowerBound: 0.4, duration: Duration(seconds: 2));
    controller_2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation_2 = CurvedAnimation(parent: controller_2, curve: Curves.ease);
    controller.forward();
    controller_2.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
    controller_2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.withOpacity(controller.value),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "img",
              child: Container(
                height: 200,
                width: animation.value * 200,
                child: Image.asset("images/brother.png"),
              ),
            ),
            Text("WELCOME",
                style: TextStyle(
                    fontSize: animation_2.value * 30,
                    fontWeight: FontWeight.bold)),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onpressed: () {
                    Navigator.pushNamed(context, Login_screen.id);
                  },
                  text: "LOGIN",
                  font_size: 50.0,
                )),
            Button(
              text: "REGISTER",
              onpressed: () {
                Navigator.pushNamed(context, Reg_Screen.id);
              },
              font_size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
