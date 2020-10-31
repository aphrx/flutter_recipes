import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text("aphrx", style: GoogleFonts.montserrat(color: Color.fromRGBO(105, 105, 108, 1), fontSize: 22,  fontWeight: FontWeight.w500)),
          Text("eats", style: GoogleFonts.montserrat(color: Color.fromRGBO(58,175,169,1), fontSize: 22, fontWeight: FontWeight.w700)),
        ]
      )
    );
  }
  
}