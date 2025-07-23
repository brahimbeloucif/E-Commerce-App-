
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Gap(20),
    Center(
      child: CustomText(
        name: 'Checkout'.toUpperCase(),
        color: Colors.black,
        size: 24,
        fontWeight: FontWeight.bold,
        spacing: 10,
      ),
    ),
        Gap(10),
    SvgPicture.asset(AppAssets.svgLine, color: Colors.black,width: 200,),
        Gap(20),
    ],
    );
  }
}
