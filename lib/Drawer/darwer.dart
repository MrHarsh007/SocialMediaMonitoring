import 'dart:math';

import 'package:data_app/Drawer/NewsChannel/Gujarati%20News/GujratiNews.dart';
import 'package:data_app/Drawer/NewsChannel/National%20News/NationalNews.dart';
import 'package:data_app/Drawer/radical.dart';
import 'package:data_app/UpdateApk/appUpdate.dart';

import 'package:data_app/serialhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:url_launcher/link.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  static const IconData whatsapp_rounded =
      IconData(0xf03b8, fontFamily: 'MaterialIcons');
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var currentVersion = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        PackageInformation();
      });
    });
  }

  PackageInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String packageName = packageInfo.packageName;
    currentVersion = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 69, 146, 182),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName:
                        "Cyber Crime - Ahmedabad City".text.xl.bold.make(),
                    accountEmail: "Social Media"
                        .text
                        .white
                        .capitalize
                        .caption(context)
                        .make(),
                    otherAccountsPicturesSize: Size.square(60),
                    otherAccountsPictures: [
                      "Ver: $currentVersion"
                          .text
                          .gray300
                          .caption(context)
                          .make()
                    ],
                    currentAccountPicture: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Image(
                          image: AssetImage("assets/cyberCrime.png"),
                        ))),
              ),
              // Container(
              //     margin: EdgeInsets.only(left: 18),
              //     child: Text(
              //       "Ver: $currentVersion",
              //       style: TextStyle(color: Colors.grey[400]),
              //     )),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                title: const Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                onTap: () => launch("mailto:rporwal0007@gmail.com"),
              ),
              ListTile(
                leading: const Icon(
                  MyDrawer.whatsapp_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  "Whatsapp",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                onTap: () => launch("https://wa.me/919426832103"),
              ),
              ListTile(
                  leading: const Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Get Access",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.3,
                  ),
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SerialHome()));
                  })),
              const Divider(
                color: Colors.black87,
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading:
                        "News Channel".text.xl.gray300.caption(context).make(),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.newspaper_rounded,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "Gujarati News",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textScaleFactor: 1.3,
                      ),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GujratiNews()));
                      })),
                  ListTile(
                      leading: const Icon(
                        Icons.newspaper,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "National News",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textScaleFactor: 1.3,
                      ),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NationalNews()));
                      })),
                  const Divider(
                    color: Colors.black87,
                    height: 8,
                  ),
                  ListTile(
                    leading: const Icon(
                      CupertinoIcons.square_fill_on_square_fill,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Radical",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textScaleFactor: 1.3,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Radical()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
