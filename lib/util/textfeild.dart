import '/util/color_resources.dart';
import '/util/textstyles.dart';
import 'package:flutter/material.dart';

Widget buildTextWithBorderField(
    TextEditingController controller,
    String hintText,
    double width,
    double height,
    TextInputType keyboardType, {
      Widget? postfixIcon,
      Function? fun,
      var inputFormatters,
      bool isObsecure = false,
      bool ishint = false,
      Widget? prefixIcon,
      bool isEnabled = true,
      int maxLine = 1,
      var align,
      Color? boxColor,
      int? textLenght,
      bool uppercase = false,
      bool readData = false,
    }) {
  return Container(
    //Type TextField
    width: width,
    height: height,
    decoration: BoxDecoration(
      color:boxColor ?? ColorResources.whiteColor,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      border: Border.all(color: ColorResources.textFieldBorderColor),
    ),
    child: TextField(
        inputFormatters:inputFormatters,
        maxLength: textLenght,
        textAlign: align ?? TextAlign.start,
        readOnly: readData,
        textCapitalization:hintText=='IFSC Code'? TextCapitalization.characters:TextCapitalization.none,
        enabled: isEnabled,
        controller: controller,
        obscureText: isObsecure,
        maxLines: maxLine,
        onChanged: (text) {
          fun;// Maintain cursor position
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor:ColorResources.whiteColor ,
          filled: true,
          counterText: '',
          suffixIcon: postfixIcon,
          prefixIcon: prefixIcon,
          contentPadding:
          ishint == true ? const EdgeInsets.all(5.0) : const EdgeInsets.all(15.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hintText, // pass the hint text parameter here
          hintStyle: TextStyle(
            color:  ColorResources.blackColor.withOpacity(0.7),
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        style:  Styles.mediumTextStyle(size: 14)
    ),
  );
}