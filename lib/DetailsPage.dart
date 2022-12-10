// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_string_escapes

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:data_app/models/Usermodel.dart';
import 'package:data_app/UpdateApk/appUpdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_share/flutter_share.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
  });

  static const String routeName = '/details-page';

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var profileName = "";
  var profileLink = "";
  var party = "";
  var description = "";
  var place = "";

  var mobileNo = "";

  UserList? userList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//Recieving data from previous screen
  @override
  void didChangeDependencies() {
    var userString = ModalRoute.of(context)?.settings.arguments as String;

    var userJson = jsonDecode(userString);
    print(userJson);
    setState(() {
      userList = UserList.fromJson(userJson);
      profileName = userList!.profileName!;
      profileLink = userList!.profileLink!;
      party = userList!.party!;
      description = userList!.description!;
      mobileNo = userList!.mobileNo!;
      place = userList!.place!;
    });
    super.didChangeDependencies();
  }

  Future<void> shareFile() async {
    await FlutterShare.share(
      title: 'Example share',
      text:
          "Name : ${profileName} \nParty : ${party} \nDescription : ${description} \nPlace: ${place} \nMobile Number : ${mobileNo} \nProfile Link : ${profileLink}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 69, 146, 182),
            title: Text(profileName),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                    'assets/BackgroundPhoto.jpg',
                  ),
                ),
              ),
              // margin: const EdgeInsets.only(left: 20, right: 10),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    50.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            'Name : ${profileName}'.text.xl2.bold.make().p12()),
                    15.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Place : ${place}'.text.xl2.make().p12()),
                    15.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Mobile No. : ${mobileNo}'
                            .text
                            .xl2
                            .bold
                            .make()
                            .p12()),
                    15.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Description : ${description}'
                            .text
                            .xl2
                            .make()
                            .p12()),
                    15.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Party : ${party}'.text.xl2.make().p12()),
                    15.heightBox,
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (profileLink == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: 'Not Available',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black);
                              } else {
                                launch(profileLink);
                              }
                            },
                            child: const Icon(Icons.link),
                          ).p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  79, 206, 93, 5))),
                                  onPressed: () {
                                    if (mobileNo == "Not Available") {
                                      Fluttertoast.showToast(
                                          msg: 'Not Available',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else {
                                      launch("https://wa.me/91${mobileNo}");
                                    }
                                  },
                                  child: const Icon(Icons.whatsapp_sharp))
                              .p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 189, 55, 53))),
                                  onPressed: () => shareFile(),
                                  child: const Icon(Icons.share))
                              .p12(),
                        )
                      ],
                    )
                  ]).p12(),
            ),
          )),
    );
  }
}
