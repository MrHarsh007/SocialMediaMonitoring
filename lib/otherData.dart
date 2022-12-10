import 'package:data_app/OtherData/BajrangDal/bajrangdal.dart';
import 'package:data_app/OtherData/BerojgarSamiti/berojgar.dart';
import 'package:data_app/OtherData/DalitSamaj/dalit.dart';
import 'package:data_app/OtherData/Kalakar/kalakar.dart';
import 'package:data_app/OtherData/Khedut/khedut.dart';
import 'package:data_app/OtherData/NSUI/nsui.dart';
import 'package:data_app/OtherData/Patidar/patidar.dart';
import 'package:data_app/OtherData/SDPI/sdpi.dart';
import 'package:data_app/OtherData/SPG/spg.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'OtherData/Aadivasi/aadivasi.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => OtherPageState();
}

class OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 69, 146, 182),
              title: const Text("Other (Samaj Sangathan)"),
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
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                                  const AadivasiPage()));
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
                                                        const AadivasiPage()));
                                          }),
                                          child: "Aadivasi"
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
                                                const BajrangDalPage()));
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
                                                        const BajrangDalPage()));
                                          }),
                                          child: "Bajrang Dal".text.xl.make())),
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
                                                  const DalitPage()));
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
                                                        const DalitPage()));
                                          }),
                                          child: "Dalit Samaj"
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
                                                const KalakarPage()));
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
                                                        const KalakarPage()));
                                          }),
                                          child: "Kalakar".text.xl.make())),
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
                                                  const KhedutPage()));
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
                                                        const KhedutPage()));
                                          }),
                                          child:
                                              "Khedut".text.semiBold.xl.make()),
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
                                                const NsuiPage()));
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
                                                        const NsuiPage()));
                                          }),
                                          child: "NSUI".text.xl.make())),
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
                                                  const PatidarPage()));
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
                                                        const PatidarPage()));
                                          }),
                                          child: "Patidar"
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
                                                const SdpiPage()));
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
                                                        const SdpiPage()));
                                          }),
                                          child: "SDPI".text.xl.make())),
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
                                                  const SpgPage()));
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
                                                        const SpgPage()));
                                          }),
                                          child: "SPG".text.semiBold.xl.make()),
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
                                                const BerojgarPage()));
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
                                                        const BerojgarPage()));
                                          }),
                                          child: "Berojgar Samiti"
                                              .text
                                              .xl
                                              .make())),
                                ),
                              ),
                            ],
                          ),
                        ]))))));
  }
}
