import 'package:data_app/MainPage.dart';
import 'package:data_app/SerialPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';

import 'package:unique_identifier/unique_identifier.dart';

import 'Drawer/darwer.dart';

class SerialHome extends StatefulWidget {
  const SerialHome({
    super.key,
  });
  @override
  _SerialHomeState createState() => new _SerialHomeState();
}

class _SerialHomeState extends State<SerialHome> {
  String _identifier = 'Unknown';

  @override
  void initState() {
    super.initState();
    initUniqueIdentifierState();
  }

  Future<void> initUniqueIdentifierState() async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier!;
    });
  }

  @override
  Widget build(BuildContext context) {
    String identifier = _identifier;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Your Serial Number:".text.xl3.red600.bold.capitalize.make(),
              5.heightBox,
              GestureDetector(
                child: new CustomToolTip(
                  text: identifier,
                ),
                onTap: () {},
              ),
              10.heightBox,
              "Long click to copy Serial Number"
                  .text
                  .bold
                  .caption(context)
                  .make(),
              25.heightBox,
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[400]),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  onPressed: () => launch(
                      "https://wa.me/9426832103?text=Serial%20Number%20:%20${_identifier}"),
                  child: "Contact Us".text.bold.make()),
              15.heightBox,
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Email Us to get access.\nPlease include your Name ,\nMobile Number and Serial Number."
                      .text
                      .xl
                      .caption(context)
                      .make(),
                  30.heightBox,
                  // "If You Already Register Then Click Below Button."
                  //     .text
                  //     .xl
                  //     .red400
                  //     .bold
                  //     .make(),
                ],
              ),
              // 15.heightBox,
              // ElevatedButton(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Colors.black),
              //         shape: MaterialStateProperty.all(const StadiumBorder())),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const SerialPage()));
              //     },
              //     child: "Access Application".text.bold.make()),
            ],
          ),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

class CustomToolTip extends StatelessWidget {
  String text;

  CustomToolTip({required this.text});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Tooltip(
          preferBelow: false,
          message: "Copy",
          child: new Text(text).text.xl3.wordSpacing(0).make()),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: text));
      },
    );
  }
}
