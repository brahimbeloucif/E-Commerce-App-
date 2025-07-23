import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.name,
    this.color,
    this.fontWeight,
    this.size,
    this.maxline,
    this.spacing,
     
  });
  final String name;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final int? maxline;
  final double ? spacing;



  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxline??3,
      overflow: maxline == 1 ? TextOverflow.ellipsis : TextOverflow.visible,
      name,
      style: GoogleFonts.tenorSans(
        fontSize: size ?? 16,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: spacing ??0.7 
        
      ),
    );
  }
}
