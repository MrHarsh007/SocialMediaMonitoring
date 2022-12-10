import 'dart:convert';
import 'dart:ui';

import 'package:app_version/app_version.dart';
import 'package:data_app/NewsChannel/newsChannelDetails.dart';
import 'package:data_app/SerialPage.dart';
import 'package:data_app/UpdateApk/downloadLink.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:data_app/DetailsPage.dart';
import 'package:data_app/Extras/home_page.dart';
import 'package:data_app/MainPage.dart';
import 'package:data_app/darwer.dart';
import 'package:data_app/serialhome.dart';
import 'package:data_app/shimmerEffect.dart';
import 'package:data_app/shimmerEffect1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:unique_identifier/unique_identifier.dart';

import '../MLA/MLA/BjpMlaDetails.dart';

class AppUpdate extends StatefulWidget {
  const AppUpdate({
    Key? key,
  }) : super(key: key);

  @override
  AppUpdateState createState() => AppUpdateState();
}

class AppUpdateState extends State<AppUpdate> {
  List _items = [];
  final url =
      "https://cybercrimesmm.github.io/SocialMediaMonitoring/AppVersion.json";
  String serial = "";
  static var currentVersion = "";
  String downloadLink = "";
  String LatestApkVersion = "";

  Future init() async {
    downloadLink = (await DownloadLink.getDownloadLink())!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    readJson();
    PackageInformation();
    init();
  }

// Fetch content from the json file
  Future<void> readJson() async {
    final response = await http.get(Uri.parse(url));
    final catJson = response.body;
    List items = jsonDecode(catJson);

    setState(() {
      _items = items;
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
    return MaterialApp(
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        Details.routeName: (context) => const Details(),
        BjpMlaDetails.routeName: (context) => const BjpMlaDetails(),
        NewsChannelDetails.routeName: (context) => const NewsChannelDetails(),
      },
      home: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          serial = _items[index]["serial"];
          return (serial == currentVersion)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const SerialPage())
              : AlertDialog(
                  backgroundColor: Colors.grey[200],
                  actions: [
                    Text(
                      "Version : $currentVersion",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                  icon: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/cyberCrime.png")),
                  title: const Center(
                      child: Text(
                    "NEW UPDATE AVAILABLE",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w900),
                  )),
                  content: Column(children: [
                    const Text(
                      "Cyber Crime Cell : Ahmedabad Police",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    10.heightBox,
                    Text("Latest Version Available: ${serial}",
                        style: TextStyle(fontWeight: FontWeight.w200)),
                    // 10.heightBox,
                    // Text(
                    //   "Click Here to Update Application",
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    10.heightBox,
                    ElevatedButton(
                        onPressed: () {
                          launch(downloadLink);
                        },
                        child: const Text("Download")),
                    8.heightBox,
                    ElevatedButton(
                        onPressed: () => launch("https://wa.me/919426832103"),
                        child: const Text("Contact Us"))
                  ]),
                );
        },
      ),
    );
  }
}
