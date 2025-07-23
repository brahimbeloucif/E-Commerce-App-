import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatefulWidget {
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
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
   @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(widget.img, width: 120),
        Gap(11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(name: widget.name, color: Colors.black),
              SizedBox(
                child: CustomText(
                  name: widget.despcription,
                  color: Color(0xff555555),
                  maxline: 1,
                ),
              ),
              Gap(5),
              Row(
                children: [
                  qtyWidget( widget.onDecrement, AppAssets.svgMin),
                  Gap(12),
                  CustomText(
                    name: widget.number.toString(),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(12),
                  qtyWidget(widget.onIncrement, AppAssets.svgPlus),
                ],
              ),
              Gap(5),

              CustomText(
                name: '\$${widget.price}',
                color: AppColors.pricingColor,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget qtyWidget(onTap, String svg) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 2),
        ),
        child: SvgPicture.asset(svg, width: 13),
      ),
    );
  }
}
