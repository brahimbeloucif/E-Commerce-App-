import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/footer_widget.dart';
import 'package:e_commerce/components/header_widget.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

class AddCardVisaScreen extends StatefulWidget {
   final dynamic editDataCard;
  const AddCardVisaScreen({super.key ,this.editDataCard});

  @override
  State<AddCardVisaScreen> createState() => _AddCardVisaScreenState();
}

class _AddCardVisaScreenState extends State<AddCardVisaScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  
  
  
  @override
  void initState() {
 if (widget.editDataCard != null) {
  cardHolderName = widget.editDataCard['name'];
  cardNumber = widget.editDataCard['number'];
  expiryDate = widget.editDataCard['date'];
  cvvCode = widget.editDataCard['cvv'];
   }
     super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(isBlack: false),
      
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Column(
                  children: [
                    HeaderApp(label: 'Payment method', spacing: 5),
                    Gap(10),
                
                    // visa card
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: showBackView,
                      onCreditCardWidgetChange: (v) {},
                      isHolderNameVisible: true,
                
                      cardBgColor: Colors.black,
                      height: 190,
                      width: double.infinity,
                    ),
                
                    //form
                    CreditCardForm(
                      formKey: _formKey,
                      cardHolderName: cardHolderName,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cvvCode: cvvCode,
                      onCreditCardModelChange:onCreditCardModelChange,
                      isCardHolderNameUpperCase: true,
                      isHolderNameVisible: true,
                    ),
                         Gap(20),
                  ],
                ),
              ),
            ),
            FooterApp(onTap: (){

              if (_formKey.currentState!.validate()) {
                final data = {
                  'number' : cardNumber,
                  'name' : cardHolderName,
                  'date' : expiryDate,
                  'cvv' : cvvCode,
 
                };
                Navigator.pop(context,data);
              }
            }, label: 'Add Card', isSvg:false,)
          ],
        ),
      ),
    );
  }


  void onCreditCardModelChange(CreditCardModel data){
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      showBackView = data.isCvvFocused;

    });

  }
}
