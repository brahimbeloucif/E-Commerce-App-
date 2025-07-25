import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Dialogsss extends StatelessWidget {
  const Dialogsss({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: 
  
  
  
         Container(
        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
      
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(20),
            CustomText(name: 'Payment success'.toUpperCase(),color: AppColors.primaryColor,),
            Gap(40),
            Stack(
              clipBehavior: Clip.none
,
              children: [
                SvgPicture.asset(AppAssets.svgDone,width: 46,),
                Positioned(
                  left: 42,
                  bottom: 45,
                  child:SvgPicture.asset(AppAssets.svgStar,width: 18,), )
                  ,
                   SvgPicture.asset(AppAssets.svgDone,width: 46,),
                Positioned(
                  right: 42,
                  bottom: 35,
                  child:SvgPicture.asset(AppAssets.svgStar,width: 12,), )
              ],
            ),
            Gap(30),
            CustomText(name: 'Your payment was success',color: AppColors.primaryColor,),
            Gap(10),
            CustomText(name: 'Payment ID 326861',color: AppColors.CusGreyColor,),
            Gap(10),
            SvgPicture.asset(AppAssets.svgLine,width: 160,color: Colors.black,),
            Gap(10),
             CustomText(name: 'Rate your purchase',color: AppColors.CusGreyColor,),
           
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              SvgPicture.asset(AppAssets.svgEmogi1,width: 46,),
              SvgPicture.asset(AppAssets.svgEmogi2,width: 46,),
              SvgPicture.asset(AppAssets.svgEmogi3,width: 46,),
                    
                ],
                    
                
              ),
              
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    
                  ),
                  child: CustomText(name: 'SUBMIT',color: Colors.white,),
                ),
      
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    
                  ),
                  child: CustomText(name: 'Back to home'.toUpperCase(),color: Colors.black,),
                ),
              ],
            ),
      
      
            
          ],
        ),
      ),
   
   
    );
  }
}