import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_generate/app/app_colors.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MyText({
    super.key,
    required this.text,
    this.textColor = AppColors.textColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
