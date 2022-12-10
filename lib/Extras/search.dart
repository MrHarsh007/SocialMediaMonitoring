import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../DetailsPage.dart';
import '../models/Usermodel.dart';

class SearchUser extends SearchDelegate {
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
                    // return Card(
                    //     child: ListTile(
                    //   leading: Text('${data?[index].id}'),
                    //   title: Text('${data?[index].firstName}'),
                    //   subtitle: Text('${data?[index].email}'),
                    //   trailing: Text("dv"),
                    // )
                    // );
                    return Card(
                      elevation: 3,
                      child: ListTile(
                          title: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(Details.routeName,
                                  arguments: jsonEncode(data![index]));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Icon(Icons.ios_share)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data?[index].profileName}'),
                              Text('${data?[index].mobileNo}'),
                            ],
                          )
                        ],
                      )).p12(),
                    );
                  });
            }));
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
  String fetchurl = "https://mrharsh007.github.io/GtuMaterialJson/data.json";
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
