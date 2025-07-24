import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please Fill All Fields';
      }
      return null;
      },
      controller: controller,
      cursorColor: Colors.black,
      style: GoogleFonts.tenorSans(), // Set font to Tenor Sans
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.tenorSans(color: Colors.grey.shade600),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Focused = grey
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400), // Enabled = black
        ),
      ),
    );
  }
}
