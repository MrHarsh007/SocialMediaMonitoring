import 'package:data_app/SerialPage.dart';
import 'package:data_app/UpdateApk/appUpdate.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/cyberCrime.png", fit: BoxFit.contain),
      logoWidth: 120,
      title: const Text(
        "Social Media : Cyber Crime",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      showLoader: true,
      loadingText: const Text("Created By > Harsh Porwal"),
      navigator: const AppUpdate(),
      durationInSeconds: 2,
    );
  }
}
