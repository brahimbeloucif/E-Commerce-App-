import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TotalyWidget extends StatelessWidget {
  const TotalyWidget({
    super.key,
    required this.number,
    required this.price,
  });

  final int number;
  final double price;

  // Getter to access the total value
  double get total => price * number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          name: 'Est. Total',
          color: Color(0xff333333),
          size: 20,
        ),
        Spacer(),
        CustomText(
          name: '\$${total}',
          size: 20,
          color: AppColors.pricingColor,
        ),
      ],
    );
  }
}
