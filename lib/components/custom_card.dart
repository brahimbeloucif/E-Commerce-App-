import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
class CustomCard extends StatelessWidget {
  final String name;
  final String img;
  final double price;
  final String despcription;
  final int number;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomCard({
    super.key,
    required this.name,
    required this.img,
    required this.price,
    required this.despcription,
    required this.number,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img, width: 120),
        const Gap(11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(name: name, color: Colors.black),
              CustomText(name: despcription, color: Colors.grey),
              const Gap(5),
              Row(
                children: [
                  qtyWidget(onDecrement, AppAssets.svgMin),
                  const Gap(12),
                  CustomText(
                    name: number.toString(),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const Gap(12),
                  qtyWidget(onIncrement, AppAssets.svgPlus),
                ],
              ),
              const Gap(5),
              CustomText(
                name: '\$${price}',
                color: AppColors.pricingColor,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget qtyWidget(VoidCallback onTap, String svg) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 2),
        ),
        child: SvgPicture.asset(svg, width: 13),
      ),
    );
  }
}
