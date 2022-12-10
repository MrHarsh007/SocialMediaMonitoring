import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShimmerEffect1 extends StatelessWidget {
  const ShimmerEffect1({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        highlightColor: Colors.grey[900]!,
        baseColor: Colors.white,
        // margin: EdgeInsets.all(10),
        // padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skelton(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                  ),
                ],
              ),
            );
          },
        )

        // Expanded(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Skelton(
        //         width: MediaQuery.of(context).size.width,
        //         height: 70,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
