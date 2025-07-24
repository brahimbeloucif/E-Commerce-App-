import 'package:e_commerce/components/custom_field.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/screens/add_card_visa_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomField(
          withCustomText: true,
          mainLabel: 'Pickup at store',
          customText: 'free',
          svg: AppAssets.svgArrowDown,
          title: 'Shipping Method',
          showTitle: true,
        ),
        
        Gap(20),
       
      ],
    );
  }
}
