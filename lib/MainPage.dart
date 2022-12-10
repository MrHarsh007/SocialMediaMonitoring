import 'package:data_app/Aap/aap.dart';
import 'package:data_app/BJP/bjp.dart';
import 'package:data_app/Congress/congress.dart';
import 'package:data_app/MLA/MLA/Bjp/BjpMLA.dart';
import 'package:data_app/Miscellaneous/Miscellaneous.dart';
import 'package:data_app/Extras/home_page.dart';
import 'package:data_app/otherData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'MlaPage.dart';
import 'darwer.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height,
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
          child: Center(
              child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              30.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BjpPage()));
                        }),
                        child:
                            const Image(image: AssetImage("assets/bjp2.png")),
                      )),
                  30.heightBox,
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CongressPage()));
                        }),
                        child: const Image(
                            image: AssetImage("assets/congress.png")),
                      )),
                ],
              ),
              30.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AapPage()));
                        }),
                        child: const Image(image: AssetImage("assets/aap.png")),
                      )),
                  30.heightBox,
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MiscellaneousPage()));
                        }),
                        child:
                            const Image(image: AssetImage("assets/other.png")),
                      )),
                ],
              ),
              40.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MlaPage()));
                        }),
                        child: Container(
                          child: Image(image: AssetImage("assets/Mla.png")),
                        ),
                      )),
                  30.heightBox,
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtherPage()));
                        }),
                        child: const Image(
                            image: AssetImage("assets/otherData.png")),
                      )),
                ],
              ),
              20.heightBox,
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  20.heightBox,
                  "Keyword Search : ".text.base.xl2.extraBlack.makeCentered(),
                  20.heightBox,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 69, 146, 182))),
                            onPressed: () =>
                                launch("https://whopostedwhat.com/"),
                            child: "Who Posted What".text.make()),
                      ),
                      // SizedBox(
                      //   height: 40,
                      //   width: 150,
                      //   child: ElevatedButton(
                      //       style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(
                      //               const Color.fromARGB(255, 69, 146, 182))),
                      //       onPressed: () =>
                      //           launch("https://tweetdeck.twitter.com/"),
                      //       child: "Tweet Deck".text.make()),
                      // ),
                    ],
                  ),
                  30.heightBox,
                  "Analysis Tools :".text.base.xl2.extraBlack.makeCentered(),
                  30.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 69, 146, 182))),
                            onPressed: () =>
                                launch("https://socialbearing.com/"),
                            child: "Social Bearing".text.make()),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 69, 146, 182))),
                            onPressed: () => launch("https://tinfoleak.com/"),
                            child: "Tinfo Leak".text.make()),
                      )
                    ],
                  ),
                  30.heightBox,
                ]),
              )

              // 30.heightBox,
              // SizedBox(
              //   height: 50,
              //   width: 150,
              //   child: ElevatedButton(
              //       onPressed: (() {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const AapPage()));
              //       }),
              //       child: "AAP".text.xl2.bold.make()),
              // ),
            ],
          )),
        ),
      ),
    );
  }
}
