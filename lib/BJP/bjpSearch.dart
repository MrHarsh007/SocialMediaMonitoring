import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../DetailsPage.dart';
import '../models/Usermodel.dart';
import '../shimmerEffect1.dart';

class BjpSearchUser extends SearchDelegate {
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
      child: FutureBuilder<List<UserList>>(
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
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Details.routeName,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data?[index].profileName}'),
                              ],
                            ),
                          )
                        ],
                      )).p12(),
                    ),
                  );
                });
          }),
    );
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
  List<UserList> results = [];
  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=9gINE5fxmiV9ZS3-plDb1ruvidVzT5mstuU6igdWlv_z1As4FHPkchgVEZlAmCoVmk18C56NPWR7uAszeultsrACmsedxISRm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJLJvURk66NN2ay1plcvyMbTh0kn-qUj9wzsS-9TSWin_ST7rBmJzz-_VgT_elKB6gogFqbiDGlNRlkFRo5ZWuQ8iW8aV7-LAA&lib=ME_G5NoYfFFYdrrH38efkuUUNXFiV3T_F";
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
