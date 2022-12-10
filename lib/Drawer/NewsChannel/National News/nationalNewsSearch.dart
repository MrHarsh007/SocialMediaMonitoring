import 'dart:convert';
import 'package:data_app/Drawer/NewsChannel/newsChannelDetails.dart';
import 'package:data_app/models/newsChannelModel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../DetailsPage.dart';
import '../../../models/Usermodel.dart';

class NationalNewsSearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios));
  }

  FetchUser _userList = FetchUser();
  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
        child: FutureBuilder<List<ChannelList>>(
            future: _userList.getUserList(query: query),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              NewsChannelDetails.routeName,
                              arguments: jsonEncode(data![index]));
                        },
                        child: ListTile(
                            title: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${data?[index].channelName}'),
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
    ]));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search User"),
    );
  }
}

class FetchUser {
  var data = [];
  List<ChannelList> results = [];

  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=1Ut9D9Bwgw0WR9BM3arKJ37sDVhwAqG3MZ48LkTkDcS1SwUSCoTY3HnIiOtmKCfF_s1tY3Sfbao7cxVtLq-RZHwgrWbuQlLEm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnIUWcuTZBykiEnDgPqNGLq8-8suSeTeeH388Mkm0L3QrR8dSuGCqZWyVysMSRxKcv9ay4_wPSeGJiubsXh1PouqiZd-gRecrMtz9Jw9Md8uu&lib=MT8EwSPUZek0GPe6XjcCBvVj-DzEcNYpJ";
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
