import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Services.dart';
import 'rest_api_i.dart';

class Flat_Buttons extends StatelessWidget {
  Flat_Buttons({this.text, @required this.onpressed, this.color});
  final String text;
  final Function onpressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: onpressed,
      color: color,
    );
  }
}

Widget buildText(final text) {
  return Column(
    children: <Widget>[
      Flat_Buttons(
        text: text,
        onpressed: () {},
      )
    ],
  );
}

class OutPut extends StatefulWidget {
  static const id = "OutPut_Screen";
  @override
  _OutPutState createState() => _OutPutState();
}

class _OutPutState extends State<OutPut> {
  Widget wids;
  Widget img_wids;
  File file;
  List<Imgjson> img_json;
  Widget image_pick() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child: RaisedButton(
          child: Text("Gallery"),
          onPressed: () async {
            try {
              // ignore: deprecated_member_use
              var img = await ImagePicker.pickImage(
                  source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
              setState(
                () {
                  file = img;
                  wids = file == null
                      ? Text('No image selected.')
                      : Container(child: Image.file(file));
                  img_wids = file == null
                      ? Text('No image selected.')
                      : Container(child: Image.file(file));
                },
              );
            } catch (e) {
              print(e);
            }
            // images.add(img_wids);
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    Services.getimg().then((value) {
      setState(() {
        img_json = value;
      });
    });
  }

  Widget listview_images() {
    return Expanded(
      child: ListView.builder(
          itemCount: null == img_json ? 0 : img_json.length,
          itemBuilder: (context, index) {
            Imgjson val = img_json[index];
            return ListTile(
                title: Image.network(val.downloadUrl),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(val.id),
                    Text(
                      val.author,
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: <Widget>[
                Flat_Buttons(
                  text: "Contact us",
                  onpressed: () {
                    setState(() {
                      wids = Contact();
                    });
                  },
                ),
                Flat_Buttons(
                  text: "Images",
                  onpressed: () {
                    setState(() {
                      wids = image_pick();
                    });
                  },
                ),
                Flat_Buttons(
                  text: "View Images",
                  onpressed: () {
                    setState(() {
                      wids = listview_images();
                    });
                  },
                ),
              ],
            ),
          ),
          Container(child: wids),
        ],
      ),
    );
  }

  Column Contact() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildText("Phone no:  +91 9123456789"),
        buildText("Email : abcde@xyz.com"),
      ],
    );
  }
}
