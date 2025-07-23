import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomField extends StatelessWidget {
  final bool withCustomText;
  final String?title;
  final String? customText;
  final String mainLabel;
  final String svg;
  final bool showTitle; // New parameter

  const CustomField({
    super.key,
    this.withCustomText = false,
    this.customText,
    required this.mainLabel,
    required this.svg,
      this.title,
    this.showTitle = true, // Default to true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          CustomText(
            name: (title ?? '').toUpperCase(),
            size: 17,
            color: Colors.grey.shade400,
          ),
        if (showTitle) Gap(9),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              CustomText(
                name: mainLabel,
                color: AppColors.orderGreyColor,
              ),
              Spacer(),
              if (withCustomText)
                CustomText(
                  name: (customText?.toUpperCase() ?? ''),
                  color: AppColors.orderGreyColor,
                ),
              Gap(20),
              SvgPicture.asset(svg),
            ],
          ),
        ),
      ],
    );
  }
}