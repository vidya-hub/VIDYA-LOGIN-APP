import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.text, @required this.onpressed, this.font_size});
  final String text;
  final Function onpressed;
  final font_size;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(fontSize: font_size, fontWeight: FontWeight.bold),
      ),
    );
  }
}
