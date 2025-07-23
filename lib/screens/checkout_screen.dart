import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/custom_card.dart';
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/components/footer_widget.dart';
import 'package:e_commerce/components/header_widget.dart';
import 'package:e_commerce/components/totaly_widget.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/screens/Place_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.name,
    required this.img,
    required this.price,
    required this.despcription,
  });

  final String name;
  final String img;
  final double price;
  final String despcription;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int number = 1;
  void incrementNumber() {
    setState(() {
      number++;
    });
  }

  void decrementNumber() {
    setState(() {
      if (number > 1) number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  HeaderApp(),
                  CustomCard(
                    name: widget.name,
                    img: widget.img,
                    price: widget.price,
                    despcription: widget.despcription,
                    number: number,
                    onIncrement: incrementNumber,
                    onDecrement: decrementNumber,
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 40,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.svgPromo, width: 24),
                        Gap(20),
                        CustomText(
                          name: 'Add promo code',
                          color: Color(0xff333333),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 40,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.svgDelivery, width: 24),
                        Gap(20),
                        CustomText(name: 'Delivery', color: Color(0xff333333)),
                        Spacer(),
                        CustomText(name: 'Free', color: Color(0xff333333)),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  Spacer(),
                  TotalyWidget(number: number, price: widget.price)                ],
              ),
            ),
          ),
          Gap(20),
          FooterApp(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => PlaceOrderScreen()),
              );
            }, label: 'Checkout', svg: AppAssets.svgShoppingBag,
          ),
        ],
      ),
    );
  }
}
