import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/custom_card.dart';
import 'package:e_commerce/components/custom_field.dart';
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/components/footer_widget.dart';
import 'package:e_commerce/components/header_widget.dart';
import 'package:e_commerce/components/info_display.dart';
import 'package:e_commerce/components/shipping_widget.dart';
import 'package:e_commerce/components/totaly_widget.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/screens/add_adress_screen.dart';
import 'package:e_commerce/screens/add_card_visa_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String name;
  final String img;
  final String despcription;
  final int number;
  final double price;
 
  const PlaceOrderScreen({
    super.key,
    required this.number,
    required this.price,
    required this.name,
    required this.img,
    required this.despcription,
 
  });

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  late int num;
  dynamic _savedData;
  dynamic _savedDataCard;

  @override
  void initState() {
    super.initState();
    num = widget.number;
  }

void incrementNumber() {
    setState(() {
      num++;
    });
  }

  void decrementNumber() {
    setState(() {
      if (num > 1) num--;
    });
  }
  void _addCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCardVisaScreen()),
    );
    if (cardData != null) {
      setState(() {
        _savedDataCard = cardData;
      });
    }
  }

  void _openAdress(context) async {
    final adressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAdressScreen()),
    );
    if (adressData != null) {
      setState(() {
        _savedData = adressData;
      });
    }
  }

  void _editAdress(context) async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAdressScreen(editData: _savedData)),
    );
    if (newAddress != null) {
      setState(() {
        _savedData = newAddress;
      });
    }
  }

  void _editCard(context) async {
    final newCardData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => AddCardVisaScreen(editDataCard: _savedDataCard),
      ),
    );
    if (newCardData != null) {
      setState(() {
        _savedDataCard = newCardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderApp(label: 'Checkout'),
                  _savedData != null && _savedDataCard != null
                      ? SizedBox.shrink()
                      : CustomText(
                          name: 'Shipping adress'.toUpperCase(),
                          size: 17,
                          color: Colors.grey.shade400,
                        ),
                  // const Gap(16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _savedData != null
                        ? InfoDisplay(
                            savedData: _savedData,
                            onTap: () => _editAdress(context),
                          )
                        : SizedBox.shrink(),
                  ),
                  Gap(10),

                  _savedData == null
                      ? CustomField(
                          onTap: () {
                            _openAdress(context);
                          },
                          mainLabel: 'Add shipping adress',
                          svg: AppAssets.svgPlus,
                        )
                      : SizedBox.shrink(),
                  // Gap(20),

                  _savedData != null && _savedDataCard != null
                      ? SizedBox.shrink()
                      : ShippingWidget(),

                  _savedDataCard != null
                      ? GestureDetector(
                          onTap: () => _editCard(context),

                          child: Column(
                            children: [
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.svgMastercard,
                                    width: 40,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    name: 'Mater Card   ',
                                    color: Colors.black,
                                  ),
                                  // CustomText(name: '...9873',color: Colors.black,),
                                  Gap(10),
                                  CustomText(
                                    name:
                                        'ending•••${_savedDataCard['number'].toString().substring(_savedDataCard['number'].toString().length - 4)}',
                                    color: Colors.black,
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    AppAssets.svgArrow,
                                    width: 20,
                                  ),
                                ],
                              ),
                              Gap(15),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                              Gap(15),
                            ],
                          ),
                        )
                      : CustomField(
                          mainLabel: 'select payment method',
                          svg: AppAssets.svgArrowDown,
                          title: 'Payment method',
                          showTitle: true,
                          onTap: _addCard,
                        ),

                 _savedData !=null&&_savedDataCard!=null? CustomCard(
                    name: widget.name,
                    img: widget.img,
                    price: widget.price,
                    despcription: widget.despcription, number: num, onIncrement:  incrementNumber, onDecrement: decrementNumber,
                     
                  ):SizedBox.shrink(),

                  Spacer(),

                  TotalyWidget(number: widget.number, price: widget.price),
                ],
              ),
            ),
          ),
          FooterApp(
            onTap: () {
              showDialog(
                barrierDismissible: false,
  context: context,
  builder: (context) => Dialog(
    
    child:
    
    
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
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close)),alignment: Alignment.topRight,),
            ),
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
                GestureDetector(
                  onTap: () {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Text(
        'Thank you for your feedback!',
        style: GoogleFonts.tenorSans(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(bottom: 160 , left: 16,right: 16),
    ),
  );
  
},

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      
                    ),
                    child: CustomText(name: 'SUBMIT',color: Colors.white,),
                  ),
                ),
      
                GestureDetector(
                  onTap: () {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (Route<dynamic> route) => false,
    );

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                    ),
                    child: CustomText(name: 'Back to home'.toUpperCase(),color: Colors.black,),
                  ),
                ),
              ],
            ),
      
      
            
          ],
        ),
      ),
   
));

            },
            label: 'place order',
            svg: AppAssets.svgShoppingBag,
            isSvg: true,
          ),
        ],
      ),
    );
  }
}
