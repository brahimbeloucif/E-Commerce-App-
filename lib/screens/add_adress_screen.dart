import 'package:e_commerce/components/custom_app_bar.dart';
import 'package:e_commerce/components/custom_form_field.dart';
import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/components/footer_widget.dart';
import 'package:e_commerce/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAdressScreen extends StatefulWidget {
  final dynamic editData;
  const AddAdressScreen({super.key,  this.editData});

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 



  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

@override
  void initState() {
 if (widget.editData != null) {
      _firstNameController.text = widget.editData['first'] ?? '';
      _lastNameController.text = widget.editData['last'] ?? '';
      _addressController.text = widget.editData['address'] ?? '';
      _cityController.text = widget.editData['city'] ?? '';
      _stateController.text = widget.editData['state'] ?? '';
      _zipController.text = widget.editData['zip'] ?? '';
      _phoneController.text = widget.editData['phone'] ?? '';
   
 }
     super.initState();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(isBlack: false),
    resizeToAvoidBottomInset: true, // مهم للتعامل مع الكيبورد
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Gap(20),
                            HeaderApp(label: 'Add shipping adress', spacing: 2),
                            Row(
                              children: [
                                Expanded(child: CustomFormField(hintText: 'First name', controller: _firstNameController)),
                                Gap(12),
                                Expanded(child: CustomFormField(hintText: 'Last name', controller: _lastNameController)),
                              ],
                            ),
                            Gap(10),
                            CustomFormField(hintText: 'Address', controller: _addressController),
                            Gap(10),
                            CustomFormField(hintText: 'City', controller: _cityController),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(child: CustomFormField(hintText: 'State', controller: _stateController)),
                                Gap(12),
                                Expanded(child: CustomFormField(hintText: 'ZIP code', controller: _zipController)),
                              ],
                            ),
                            Gap(10),
                            CustomFormField(hintText: 'Phone number', controller: _phoneController),
                            Spacer(), // يدفع الزر للأسفل
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
  FooterApp(
 
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final data = {
                        'first': _firstNameController.text,
                        'last': _lastNameController.text,
                        'address': _addressController.text,
                        'city': _cityController.text,
                        'state': _stateController.text,
                        'zip': _zipController.text,
                        'phone': _phoneController.text,
                      };
                      Navigator.pop(context, data);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.error_outline, color: Colors.white),
                              SizedBox(width: 8),
                              CustomText(name: 'Please fill all fields correctly.', color: Colors.white),
                            ],
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          margin: EdgeInsets.only(bottom: 100, left: 16, right: 16),
                        ),
                      );
                    }
                  },
                  label: 'Add now',
                  isSvg: false,
                
  ),

        ],
            ),
          );
        },
      ),
    ),
  );
}
}
