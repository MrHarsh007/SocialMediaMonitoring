import 'dart:convert';
import 'package:data_app/Drawer/NewsChannel/newsChannelDetails.dart';
import 'package:data_app/models/newsChannelModel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../DetailsPage.dart';
import '../../../models/Usermodel.dart';

class GujratiNewsSearchUser extends SearchDelegate {
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
