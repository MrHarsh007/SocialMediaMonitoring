import 'package:data_app/DetailsPage.dart';
import 'package:data_app/MLA/MLA/BjpMlaDetails.dart';
import 'package:data_app/MainPage.dart';
import 'package:data_app/SerialPage.dart';
import 'package:data_app/Extras/home_page.dart';

import 'package:data_app/UpdateApk/appUpdate.dart';
import 'package:data_app/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
