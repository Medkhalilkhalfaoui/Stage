
import 'package:flutter/material.dart';


const Color bluishClr = Color(0xFF4e5ae8);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);


TextStyle get titleStyle {
  return
   const TextStyle(
      color:  Colors.black54 ,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

}
TextStyle get subtitleStyle {
  return  const TextStyle(
    color:   Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

}
TextStyle get headingStyle {
  return
    const TextStyle(
      color:  Colors.black54 ,
      fontSize: 24,
      fontWeight: FontWeight.bold,

    );
}