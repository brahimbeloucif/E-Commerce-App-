import 'package:e_commerce/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FooterApp extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final String ? svg;
  final bool isSvg;
  const FooterApp({
    super.key,
    required this.onTap,
    required this.label,
     this.svg,
    required this.isSvg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        width: double.infinity,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          if (isSvg && svg != null) ...[
  SvgPicture.asset(svg!, width: 24, color: const Color(0xffFCFCFC)),
  Gap(20),
],

            CustomText(
              name: label.toUpperCase(),
              color: Color(0xffFCFCFC),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

   
}
