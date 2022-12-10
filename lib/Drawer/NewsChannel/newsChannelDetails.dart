import 'dart:convert';
import 'package:data_app/models/MLAModel.dart';
import 'package:data_app/models/newsChannelModel.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:data_app/models/Usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

class NewsChannelDetails extends StatefulWidget {
  const NewsChannelDetails({
    super.key,
  });

  static const String routeName = '/NewsChanneldetails-page';

  @override
  State<NewsChannelDetails> createState() => NewsChannelDetailsState();
}

class NewsChannelDetailsState extends State<NewsChannelDetails> {
  var channelName = "";
  var facebook = "";
  var twitter = "";
  var instagram = "";
  var youtube = "";
  var website = "";

  var mobileNo = "";

  ChannelList? userList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> shareFile() async {
    await FlutterShare.share(
      title: 'Example share',
      text:
          "Channel Name : ${channelName} \nFacebook : ${facebook} \nTwitter : ${twitter} \nInstagram: ${instagram} \nYoutube : ${youtube} \nWebsite : ${website} \nMobile Number : ${mobileNo} \nFacebook Link : ${facebook} \nTwitter Link : ${twitter}",
    );
  }

//Recieving data from previous screen
  @override
  void didChangeDependencies() {
    var userString = ModalRoute.of(context)?.settings.arguments as String;

    var userJson = jsonDecode(userString);
    print(userJson);
    setState(() {
      userList = ChannelList.fromJson(userJson);

      channelName = userList!.channelName!;
      facebook = userList!.facebook!;
      twitter = userList!.twitter!;
      mobileNo = userList!.mobileNo!;

      youtube = userList!.youtube!;
      instagram = userList!.instagram!;
      website = userList!.website!;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 69, 146, 182),
            title: Text(channelName),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                    'assets/BackgroundPhoto.jpg',
                  ),
                ),
              ),
              // margin: const EdgeInsets.only(left: 20, right: 10),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    50.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Channel Name : ${channelName}'
                            .text
                            .xl2
                            .bold
                            .make()
                            .p12()),
                    15.heightBox,
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Mobile No : ${mobileNo}'
                            .text
                            .bold
                            .xl2
                            .make()
                            .p12()),
                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (facebook == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: 'Not Available',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black);
                              } else {
                                launch(facebook);
                              }
                            },
                            child: const Icon(Icons.facebook_outlined),
                          ).p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 172, 238, 8)),
                            ),
                            onPressed: () {
                              if (twitter == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: 'Not Available',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black);
                              } else {
                                launch(twitter);
                              }
                            },
                            child: const Icon(
                              SocialIconsFlutter.twitter,
                              color: Colors.white,
                            ),
                          ).p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  79, 206, 93, 5))),
                                  onPressed: () {
                                    if (mobileNo == "Not Available") {
                                      Fluttertoast.showToast(
                                          msg: 'Not Available',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else {
                                      launch("https://wa.me/91${mobileNo}");
                                    }
                                    ;
                                  },
                                  child: const Icon(Icons.whatsapp_sharp))
                              .p12(),
                        ),
                      ],
                    ),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(255, 0, 0, 25)),
                            ),
                            onPressed: () {
                              if (youtube == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: 'Not Available',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black);
                              } else {
                                launch(youtube);
                              }
                            },
                            child: const Icon(SocialIconsFlutter.youtube),
                          ).p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(248, 209, 74, 175)),
                            ),
                            onPressed: () {
                              if (instagram == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: 'Not Available',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black);
                              } else {
                                launch(instagram);
                              }
                            },
                            child: const Icon(
                              SocialIconsFlutter.instagram,
                              color: Colors.white,
                            ),
                          ).p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  250, 230, 153, 52))),
                                  onPressed: () {
                                    if (website == "Not Available") {
                                      Fluttertoast.showToast(
                                          msg: 'Not Available',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else {
                                      launch(website);
                                    }
                                  },
                                  child: const Icon(Icons.manage_search))
                              .p12(),
                        ),
                      ],
                    ),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          // ignore: prefer_const_constructors
                                          Color.fromARGB(255, 117, 113, 113))),
                                  onPressed: () {
                                    if (mobileNo == "Not Available") {
                                      Fluttertoast.showToast(
                                          msg: 'Not Available',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else {
                                      launch("tel:${mobileNo}");
                                    }
                                  },
                                  child: const Icon(Icons.call))
                              .p12(),
                        ),
                        SizedBox(
                          height: 70,
                          width: 120,
                          child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          // ignore: prefer_const_constructors
                                          Color.fromARGB(255, 189, 55, 53))),
                                  onPressed: () {
                                    shareFile();
                                  },
                                  child: const Icon(Icons.share))
                              .p12(),
                        )
                      ],
                    )
                  ]).p12(),
            ),
          )),
    );
  }
}
