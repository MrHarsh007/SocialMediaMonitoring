import 'dart:convert';
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

import '../shimmerEffect1.dart';
import 'MiscellaneousSearch.dart';

class MiscellaneousPage extends StatefulWidget {
  const MiscellaneousPage({super.key});

  static const String routeName = '/congress-page';

  @override
  State<MiscellaneousPage> createState() => MiscellaneousPageState();
}

class MiscellaneousPageState extends State<MiscellaneousPage> {
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
              title: const Text("Miscellaneous"),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: MiscellaneousSearchUser());
                    },
                    icon: Icon(Icons.search))
              ],
            ),
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
                child: Column(children: [
                  Expanded(
                    child: FutureBuilder<List<UserList>>(
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
                                          Details.routeName,
                                          arguments: jsonEncode(data![index]));
                                    },
                                    child: ListTile(
                                        title: Row(
                                      children: [
                                        // Container(
                                        //   height: 40,
                                        //   width: 40,
                                        //   decoration: BoxDecoration(
                                        //     // color: Colors.green,
                                        //     borderRadius: BorderRadius.circular(10),
                                        //   ),
                                        //   child:
                                        //       Center(child: Icon(Icons.ios_share)),
                                        // ),
                                        // const SizedBox(
                                        //   width: 20,
                                        // ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${data?[index].profileName}'),
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
  List<UserList> results = [];
  // String fetchurl = "https://rporwal0007.github.io/userData/Miscellaneous.json";
  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=q5uaXjsCfqpmByCccFzHKoBdQEGc_jsE5cz4-noIfSr8MHTRZc8afEde_wIExhcWTMGzXJooyTI9qmhedR1RByDrfzYqyGG2m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnOjausT7cDCZuFgSrA4H4uZVEDm22lNpLiZeJ-fG2eFLtx4L274e43PuHHEkGMc5vEvE58hKECWqcgN8cPRpcFPO1STXF_M8Vw&lib=MBllDE4Zru2vyGVppgR_m40UNXFiV3T_F";
  Future<List<UserList>> getUserList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => UserList.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.profileName!
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
