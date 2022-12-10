import 'dart:convert';
import 'dart:ui';
import 'package:package_info_plus/package_info_plus.dart';
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

import 'MLA/MLA/BjpMlaDetails.dart';

class SerialPage extends StatefulWidget {
  const SerialPage({
    Key? key,
  }) : super(key: key);

  @override
  _SerialPageState createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> {
  var currentVersion = "";
  late bool _isLoading;
  List _items = [];
  final url =
      "https://script.googleusercontent.com/macros/echo?user_content_key=aa-gPFYokmUqDc9cTEwZuGt3BTjgep5xickQ5qnN4B2kq7-fNv7Efd8Hy3Sj0VdHCkDZQllul8nuHvQZkYJr1qzEH_A7LClvm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnKP1kCMMat2-zhoiM6Ag9W9ezUn3P0fBCnWXXxCh7YpLApXbAQF1_nH8L1tDjqB6kJXVE2KlsjTUZpfsL64Lz-GcWh7vJDtZAg&lib=M0sti_rMLw6lbZCWWKACdtEUNXFiV3T_F";

  String _identifier = 'Unknown';

  @override
  void initState() {
// Showing Circular indicator for 2 second
    _isLoading = true;
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });

    // TODO: implement initState
    super.initState();
    initUniqueIdentifierState();

    readJson();
  }

// Fetch content from the json file
  Future<void> readJson() async {
    new CircularProgressIndicator();
    final response = await http.get(Uri.parse(url));
    final catJson = response.body;

    List items = jsonDecode(catJson);
    setState(() {
      _items = items;
    });
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // toolbarHeight: 50,
            backgroundColor: const Color.fromARGB(255, 69, 146, 182),
            // foregroundColor: Colors.white,
            title: Column(
              children: const [
                Text(
                  "Contact Us to Get Access",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          drawer: const MyDrawer(),
          body: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                // ignore: prefer_const_constructors
                image: AssetImage(
                  'assets/BackgroundPhoto.jpg',
                ),
              ),
            ),
            child: _isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const ShimmerEffect())

                // SizedBox(
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     child: Center(child: const CircularProgressIndicator()),
                //   )
                : ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      String serial = _items[index]["serial"];

                      return Row(children: <Widget>[
                        if (serial == _identifier)
                          Expanded(
                              child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: const MyWidget()))
                      ]);
                    },
                  ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SerialHome()));
              }),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color.fromARGB(255, 69, 146, 182),
              child: const Icon(CupertinoIcons.helm),
            ),
          )),
    );
    // );
    // routes: {
    //   HomePage.routeName: (context) => const HomePage(),
    //   Details.routeName: (context) => const Details(),
    //   BjpMlaDetails.routeName: (context) => const BjpMlaDetails(),
    // });
  }
}
