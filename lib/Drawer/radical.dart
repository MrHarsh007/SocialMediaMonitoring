import 'dart:convert';

import 'package:data_app/shimmerEffect1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../shimmerEffect.dart';

class Radical extends StatefulWidget {
  const Radical({super.key});

  @override
  State<Radical> createState() => _RadicalState();
}

class _RadicalState extends State<Radical> {
  late bool _isLoading;
  List _items = [];
  final url =
      "https://script.googleusercontent.com/macros/echo?user_content_key=Iye7YCiwETs53HjbhclyweBRl_Gy5z1TenKDGaVXju197wPDKmwmdiZMCR_2HH0PnLidoKIvyD65wEKqszAdG-EM7Swkvt2jm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnDJbfMABKFwvQuUnMq0GZwFB2PO-aVuQq36DeJvWiyh26NghZfQUvSH8_uh5NR9rexdHRsk1OdfnwdrSNpx57zhW5pzSkMqugw&lib=M4rQvhfPMJcq50H6FAM6430UNXFiV3T_F";

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });

    // TODO: implement initState
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final response = await http.get(Uri.parse(url));
    final catJson = response.body;

    List items = jsonDecode(catJson);
    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 146, 182),
        title: const Text("Radical Data"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            fit: BoxFit.cover,
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
                child: const ShimmerEffect1())
            : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  String url = _items[index]["Link"];
                  String name = _items[index]["Name"];
                  return Card(
                    child: ListTile(
                      title: Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () => launch(url),
                    ).p12(),

                    // InkWell(
                    //     onTap: () {
                    //       launch(url);
                    //     },
                    //     child: ListTile(
                    //       title: Text(name),
                    //     )),
                  );
                },
              ),
      ),
    );
  }
}
