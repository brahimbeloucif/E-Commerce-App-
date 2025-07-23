import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/models/cover_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/checkout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(isBlack: true),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.svg10),
          ),
          Positioned(
            top: 105,
            left: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.svgCollection),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.svgOctober,color: Colors.deepPurple,),
          ),

          //
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: Column(
                    children: [
                      Gap(120),
                  
                      Image.asset(AppAssets.imgCover1),
                      Gap(20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        
                        itemCount: ProductModel.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.49,
                        ),
                        itemBuilder: (context, index) {
                          final item =ProductModel.products[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c)=>CheckoutScreen(name: item.name, img: item.img, price: item.price, despcription: item.despcription))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(item.img),
                                Gap(10),
                                
                                      
                                CustomText(name:  item.name,color:Color(0xffFCFCFC), size: 16, fontWeight: FontWeight.bold,),
                                CustomText(maxline: 1,name:  item.despcription,color:Colors.grey, size: 12,),
                                CustomText(name:  '\$ ${item.price}',color: AppColors.pricingColor, size: 20,),
                                 
                                
                              
                              ],
                            ),
                          );
                        },
                      ),
                    Gap(20),
                    CustomText(name: 'You may also like'.toUpperCase(),size: 24,),
                    Gap(5),
                    SvgPicture.asset(AppAssets.svgLine),
                    Gap(20),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        
                        
                        scrollDirection: Axis.horizontal,
                        itemCount: CoverModel.covers.length,
                        itemBuilder: 
                      
                      
                        (context , index){
                        
                        
                        final item = CoverModel.covers[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset(item.img,height: 320,fit: BoxFit.cover,),
                            ),
                            Gap(10),
                            
                            CustomText(name: item.label.toUpperCase(),size: 20,),
                          ],
                        );
                      
                      }),
                    )
                    ,Gap(50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90.0),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      
                          Icon(Ionicons.logo_twitter ,color:  Colors.grey[500],),
                          Icon(Ionicons.logo_instagram,color: Colors.grey[500],),
                          Icon(Ionicons.logo_youtube,color: Colors.grey[500],),
                        ],
                        
                      ),
                                  
                    ),
                    Gap(20),
                                  
                    SvgPicture.asset(AppAssets.svgLine),
                    Gap(20),
                    CustomText(name: 'support@openui.design',size: 18,color: Colors.grey[500],),   Gap(8),
                    CustomText(name: '+60 825 876',size: 18,color: Colors.grey[500],),
                    Gap(8),
                    CustomText(name: '08:00 - 22:00 - Everyday',size: 18,color: Colors.grey[500],),
                     Gap(20),
                    SvgPicture.asset(AppAssets.svgLine),
                      
                       Gap(30),  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                  
                                      CustomText(name: 'About',size: 18,color: Colors.grey[500],),
                                      CustomText(name: 'Contact',size: 18,color: Colors.grey[500],),
                                      CustomText(name: 'Blog',size: 18,color: Colors.grey[500],),
                                  
                         
                        ],
                        
                      ),
                                  
                    ),
                   
                    ],
                  
                  ),
                ),
                Container(
  width: double.infinity,
  color: Color(0xff1A1A1A), // أفتح قليلاً من الخلفية العامة
  padding: EdgeInsets.all(12),
  child: Center(
    child: CustomText(
      color: Colors.white, // أبيض ليظهر بوضوح
      fontWeight: FontWeight.bold,
      name: 'Copyright© OpenUI All Rights Reserved.',
    ),
  ),
)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
