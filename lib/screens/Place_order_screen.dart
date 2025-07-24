import 'package:e_commerce/components/custom_app_bar.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  final int number ;
  final double price;
  const PlaceOrderScreen({super.key, required this.number, required this.price});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {

  dynamic _savedData;
  dynamic _savedDataCard;

   void _addCard() async{
    
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCardVisaScreen()),
    );
    if (cardData != null) {
      setState(() {
        _savedDataCard = cardData;
      });
    }}
   




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

  void _editAdress(context) async{
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAdressScreen(
        editData: _savedData
        ),
        ),
    );
    if (newAddress != null) {
      setState(() {
        _savedData = newAddress;
      });
    }
  }

  void _editCard(context) async{
    final newCardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCardVisaScreen(
        editDataCard: _savedDataCard
        ),
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
                  CustomText(
                    name: 'Shipping adress'.toUpperCase(),
                    size: 17,
                    color: Colors.grey.shade400,
                  ),
                  const Gap(16),

                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _savedData != null
                        ?
               InfoDisplay(savedData: _savedData,
                          onTap: () => _editAdress(context)
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
                  Gap(20),

              
                  ShippingWidget(),


                _savedDataCard!=null ?  GestureDetector(
                          onTap: () => _editCard(context),

                  child: Column(
                      children: [
                        Divider(thickness: 1,color: Colors.grey.shade300,),
                        Gap(15),
                        Row(
                          children: [
                            
                            SvgPicture.asset(AppAssets.svgMastercard,width: 40,),
                           Gap(10),
                            CustomText(name: 'Mater Card   ',color: Colors.black,),
                            // CustomText(name: '...9873',color: Colors.black,),
                           Gap(10),
                            CustomText(name: 'ending•••${_savedDataCard['number'].toString().substring(_savedDataCard['number'].toString().length - 4)}', color: Colors.black),
                            Spacer(),
                            SvgPicture.asset(AppAssets.svgArrow,width: 20,),
                        
                          ],
                        ),
                        Gap(15),
                        Divider(thickness: 1,color: Colors.grey.shade300,),
                      ],
                    ),
                )
                
                
                 :  CustomField(
          mainLabel: 'select payment method',
          svg: AppAssets.svgArrowDown,
          title: 'Payment method',
          showTitle: true,
          onTap: _addCard,
        ),
                  Spacer(),

                  TotalyWidget(number: widget.number, price: widget.price),
                ],
              ),
            ),
          ),
          FooterApp(
            onTap: () {},
            label: 'place order',
            svg: AppAssets.svgShoppingBag,
            isSvg: true,
          ),
        ],
      ),
    );
  }
}


   