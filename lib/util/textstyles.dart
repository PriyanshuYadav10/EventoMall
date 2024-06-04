import '/util/color_resources.dart';
import 'package:flutter/material.dart';

class Styles {
  static thinTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w100,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.underline : TextDecoration.none);
  }

  static lightTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.underline : TextDecoration.none);
  }

  static regularTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool lineThrough = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
        decorationThickness: 2,
        decoration:
        lineThrough ? TextDecoration.lineThrough : TextDecoration.none);
  }

  static mediumTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.underline : TextDecoration.none);
  }

  static semiBoldTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: ColorResources.appColor,decorationThickness: 3);
  }

  static semiBoldTextStyle2({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.underline : TextDecoration.none,
        decorationColor: ColorResources.whiteColor,decorationThickness: 3);
  }

  static boldTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underlineNeeded = false,
  }) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        decoration:
        underlineNeeded ? TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: ColorResources.blackColor,decorationThickness: 3);
  }
}
