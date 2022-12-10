import 'package:data_app/MLA/MLA/Aap/AapMLA.dart';
import 'package:data_app/MLA/MLA/Bjp/BjpMLA.dart';
import 'package:data_app/MLA/MLA/Congress/CongressMla.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class MlaPage extends StatefulWidget {
  const MlaPage({super.key});

  @override
  State<MlaPage> createState() => MlaPageState();
}

class MlaPageState extends State<MlaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 69, 146, 182),
              title: const Text("Candidate Data (2022)"),
            ),
            body: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
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
                    child: Center(
                        child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: InkWell(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BjpMLAPage()));
                                    }),
                                    child: Container(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color.fromARGB(
                                                          255, 69, 146, 182))),
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BjpMLAPage()));
                                          }),
                                          child: "BJP Candidate"
                                              .text
                                              .semiBold
                                              .xl
                                              .make()),
                                    ),
                                  )),
                              30.heightBox,
                              SizedBox(
                                height: 80,
                                width: 120,
                                child: InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CongressMLAPage()));
                                  }),
                                  child: SizedBox(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color.fromARGB(
                                                          255, 69, 146, 182))),
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CongressMLAPage()));
                                          }),
                                          child: "Congress Candidate"
                                              .text
                                              .xl
                                              .make())),
                                ),
                              ),
                            ],
                          ),
                          50.heightBox,
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 120,
                                child: InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CongressMLAPage()));
                                  }),
                                  child: SizedBox(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color.fromARGB(
                                                          255, 69, 146, 182))),
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AapMLAPage()));
                                          }),
                                          child:
                                              "Aap Candidate".text.xl.make())),
                                ),
                              )
                            ],
                          )
                        ]))))));
  }
}
