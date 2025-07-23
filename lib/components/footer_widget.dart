
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
class FooterApp extends StatelessWidget {
  const FooterApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
       width: double.infinity,
       color: Colors.black,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SvgPicture.asset(AppAssets.svgShoppingBag, width: 24,color: Color(0xffFCFCFC),),
          Gap(20),
           CustomText(name: 'Checkout'.toUpperCase(), color: Color(0xffFCFCFC),size: 20,),
          
         ],
       ),
     );
  }
}
