import '/util/color_resources.dart';
import 'package:flutter/material.dart';

Widget customButton(
    Function onPressed,
    String buttonText,
    double? radius,
    String icon,
    BuildContext context, {
      Color? color,
      Color? txtColor,
      Color? borderColor,
      double? height,
      double? width,
    }) {
  return Container(
      margin: const EdgeInsets.only(bottom: 0, top: 10),
      decoration: color == null
          ? BoxDecoration(
        border: Border.all(color: borderColor ?? ColorResources.borderColor),
          gradient: GradientResources.gradientColor1,
          borderRadius: BorderRadius.circular(radius ?? 20))
          : BoxDecoration(
          border: Border.all(color:borderColor ?? ColorResources.borderColor),
          color: color, borderRadius: BorderRadius.circular(radius ?? 20)),
      height: height ?? 45,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 20)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Row(
            mainAxisAlignment:
            icon == '' ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  buttonText,
                  style:  TextStyle(
                      color:txtColor ?? ColorResources.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              icon == ''
                  ? const SizedBox()
                  : SizedBox(
                width: MediaQuery.of(context).size.width / 5.7,
              ),
              icon == ''
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  icon,
                  height: 25,
                ),
              )
            ],
          ),
          onPressed: () {
            onPressed();
          }));
}