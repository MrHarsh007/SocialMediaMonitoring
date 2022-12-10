import 'dart:convert';
import 'package:data_app/MLA/MLA/BjpMlaDetails.dart';
import 'package:http/http.dart' as http;

import 'package:data_app/DetailsPage.dart';
import 'package:data_app/models/Usermodel.dart';

import 'package:data_app/Extras/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../shimmerEffect1.dart';
import '../../../models/MLAModel.dart';
import 'BjpMLASearch.dart';

class BjpMLAPage extends StatefulWidget {
  const BjpMLAPage({super.key});

  static const String routeName = '/bjpMLA-page';

  @override
  State<BjpMLAPage> createState() => _BjpMLAPageState();
}

class _BjpMLAPageState extends State<BjpMLAPage> {
  FetchUser _userList = FetchUser();
  List<Map<String, dynamic>> foundUser = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 69, 146, 182),
              title: const Text("BJP Candidate"),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: BjpMLASearchUser());
                    },
                    icon: Icon(Icons.search))
              ],
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
                child: Column(children: [
                  Expanded(
                    child: FutureBuilder<List<BjpMlaUserList>>(
                        future: _userList.getUserList(),
                        builder: (context, snapshot) {
                          var data = snapshot.data;
                          if (!snapshot.hasData) {
                            return const ShimmerEffect1();
                          }

                          return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 3,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          BjpMlaDetails.routeName,
                                          arguments: jsonEncode(data![index]));
                                    },
                                    child: ListTile(
                                        title: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${data?[index].candidateName}'),
                                              Text(
                                                  'Assembly : ${data?[index].assemblyName}'),
                                            ],
                                          ),
                                        )
                                      ],
                                    )).p12(),
                                  ),
                                );
                              });
                        }),
                  ),
                ]))));
  }
}

class FetchUser {
  var data = [];
  List<BjpMlaUserList> results = [];
  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=nJPDAS8HdA-8X0_UKFHsbJpQwz0FZZV0CnmPciPaaoULbTxmwYnl7k404MOchlKg2PJPf9NZBKmfH0qv4TddwTuyCallM69-m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJS8NVrY_vMysSLYTC6nRs0m5yfa4iSKdD_LiXKaIfnBQFJNsdCApYxnf7hmag1nFn1Kea6q2--HReenKEAlj1j3rmDstCHHU9z9Jw9Md8uu&lib=M7oI_IngJZFGruyQ6jvIC91j-DzEcNYpJ";
  Future<List<BjpMlaUserList>> getUserList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => BjpMlaUserList.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.assemblyName!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print("api error");
      }
    } on Exception catch (e) {
      print("error :$e");
    }
    return results;
  }
}
