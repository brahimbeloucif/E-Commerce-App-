import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/custom_field.dart';
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/components/footer_widget.dart';
import 'package:e_commerce/components/header_widget.dart';
import 'package:e_commerce/components/totaly_widget.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderApp(),
                  CustomText(
                    name: 'Shipping adress'.toUpperCase(),
                    size: 17,
                    color: Colors.grey.shade400,
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              name: 'Iris Watson'.toUpperCase(),
                              size: 16,
                              color: Colors.black,
                            ),
                            const Gap(8),
                            CustomText(
                              name: '606-3727 Ullamcorper. Street',
                              size: 16,
                              color: AppColors.orderGreyColor,
                            ),
                            const Gap(4),
                            CustomText(
                              name: 'Roseville NH 11523',
                              size: 16,
                              color: AppColors.orderGreyColor,
                            ),
                            const Gap(4),
                            CustomText(
                              name: '(786) 713-8616',
                              size: 16,
                              color: AppColors.orderGreyColor,
                            ),
                          ],
                        ),
                        SvgPicture.asset(AppAssets.svgArrow, width: 28),
                      ],
                    ),
                  ),
                  Gap(10),
                  CustomField(
                    mainLabel: 'Add shipping adress',
                    svg: AppAssets.svgPlus,
                  ),
                  Gap(20),
                 
                  Gap(10),
                  CustomField(
                    withCustomText: true,
                    mainLabel: 'Pickup at store',
                    customText: 'free',
                    svg: AppAssets.svgArrowDown,
                    title: 'Shipping Method',
                    showTitle: true,
                  ),
            
                  Gap(20),
                   CustomField(
                     mainLabel: 'select payment method',
                     svg: AppAssets.svgArrowDown,
                    title: 'Payment method',
                    showTitle: true,
                  ),
                  Spacer(),
                                    TotalyWidget(number: 12, price: 121),
                                    
                                    
                                        ],
            
                
                
              ),
            ),
          ),
           FooterApp(onTap: (){
                                      
                                    }, label: 'place order', svg: AppAssets.svgShoppingBag,)
                                               
        ],
      ),
    );
  }
}
