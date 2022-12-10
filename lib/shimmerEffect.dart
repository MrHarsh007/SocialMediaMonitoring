import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[900]!,
      baseColor: Colors.grey[700]!,
      child: Column(
        children: [
          30.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Skelton(
                height: 120,
                width: 120,
              ),
              Skelton(
                height: 120,
                width: 120,
              ),
            ],
          ),
          30.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Skelton(
                height: 120,
                width: 120,
              ),
              Skelton(
                height: 120,
                width: 120,
              ),
            ],
          ),
          30.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Skelton(
                height: 120,
                width: 120,
              ),
              Skelton(
                height: 120,
                width: 120,
              ),
            ],
          ),
          50.heightBox,
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black.withOpacity(0.15)),
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              30.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Skelton(
                    height: 40,
                    width: 150,
                  )
                ],
              ),
              50.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Skelton(
                    height: 40,
                    width: 150,
                  ),
                  Skelton(
                    height: 40,
                    width: 150,
                  ),
                ],
              ),
              30.heightBox,
            ]),
          )
        ],
      ),
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.18),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
