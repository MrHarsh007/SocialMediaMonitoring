import 'dart:convert';
import 'package:data_app/Aap/aapSearch.dart';
import 'package:data_app/Drawer/NewsChannel/Gujarati%20News/GujratiNewsSearch.dart';
import 'package:data_app/Drawer/NewsChannel/newsChannelDetails.dart';
import 'package:data_app/models/newsChannelModel.dart';
import 'package:data_app/shimmerEffect1.dart';
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

class GujratiNews extends StatefulWidget {
  const GujratiNews({super.key});

  static const String routeName = '/GujratiNews-page';

  @override
  State<GujratiNews> createState() => GujratiNewsState();
}

class GujratiNewsState extends State<GujratiNews> {
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
              title: const Text("Gujarati News"),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: GujratiNewsSearchUser());
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
                    child: FutureBuilder<List<ChannelList>>(
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
                                          NewsChannelDetails.routeName,
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
                                                  '${data?[index].channelName}'),
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
  List<ChannelList> results = [];

  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=Il5jVfPg2s2jryFTNALlVbRhWYs6WbVV8dfpcSiGArwOmEvfz7V2xr0SfaKpgTlmE6MALwNC0fenV631Wz_gqCeEEUhtECpKm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnAhR0n7-SR4XUuOQQUjnn1FfsOoMeG2kYCy7FIgHY5ApdCST30YHR1ljAywNLH8sPhdKvhC_NeGj0AaZ0rHJjHTQqzqdn85bng&lib=MgjHFCpIBOJ1coSDoiX9Pi0UNXFiV3T_F";
  Future<List<ChannelList>> getUserList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => ChannelList.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.channelName!
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
