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

import '../../Congress/congressSearch.dart';
import '../../shimmerEffect1.dart';
import 'dalitSearch.dart';

class DalitPage extends StatefulWidget {
  const DalitPage({super.key});

  static const String routeName = '/Dalit-page';

  @override
  State<DalitPage> createState() => _DalitPageState();
}

class _DalitPageState extends State<DalitPage> {
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
              title: const Text("Dalit Samaj"),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: DalitSearchUser());
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
                                  elevation: 2,
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
  String fetchurl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=9yl0VeleDdj9G7VtDmb7gEj-F1a-QzIwYEEL1P8Mf3tNycKLyO4obbSYsNz0Z-MfAkIkjyY7gQTAEBFtsSGp1Uwp_FXcomvvm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnKSQoAo5uPXh55AOnqKgjS3TbHXruxqXz94BoPdNWh1Ls4Ch7NkjyZJ3aX0Lp8jRueKf75lJ-I20xjksJFr94zDjDAqPkTAbJQ&lib=MCV7UzLeQS7rRMi6jkXnrSUUNXFiV3T_F";
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
