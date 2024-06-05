import 'package:flutter/material.dart';

class ColorResources {
  static const Color appColor = Color(0xffD6B0A5);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff000000);
  static const Color containerBgColor1 = Color(0xffF3F3F3);
  static const Color borderColor = Color(0xffD7D7D7);
  static const Color indicatorColor = Color(0xffE2DEDE);
  static const Color secondaryAppColor = Color(0xff283a6c);




  static const Color textFieldBorderColor = Color(0xffD7D7D7);
}


class GradientResources {
  static const Gradient gradientColor1 = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFEFD4CC), // Top gradient color
      Color(0xFFD6B0A5), // Bottom gradient color
      Color(0xFFD6B0A5), // Bottom gradient color
    ],
  );
  static const Gradient gradientColor2 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight, // Added end alignment for clarity
    stops: [0.1,0.5, 0.9],
    colors: [Color(0xff3C60D8),Color(0xff3C60D8), Color(0xff44C7F1)],
  );
}
