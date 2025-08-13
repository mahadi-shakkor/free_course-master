import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icons;
  const CustomTextField({super.key, this.hintText, this.icons});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Color(0xFFF2F2F2),
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Color(0xFF515151),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            prefixIcon: Icon(icons, color: Color(0xFF515151),),
            enabledBorder: OutlineInputBorder(

            ),
            focusedBorder: OutlineInputBorder(

            )
        ),
      ),
    );
  }
}
