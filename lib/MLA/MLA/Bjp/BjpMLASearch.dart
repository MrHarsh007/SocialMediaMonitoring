import 'dart:convert';
import 'package:data_app/MLA/MLA/BjpMlaDetails.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../models/MLAModel.dart';

class BjpMLASearchUser extends SearchDelegate {
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
        child: FutureBuilder<List<BjpMlaUserList>>(
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
                          Navigator.of(context).pushNamed(
                              BjpMlaDetails.routeName,
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
                                  Text('${data?[index].candidateName}'),
                                  Text(
                                      'Assembly  : ${data?[index].assemblyName}'),
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
