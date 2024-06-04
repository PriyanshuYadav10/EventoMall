import 'dart:io';

import '/util/button.dart';
import '/util/color_resources.dart';
import '/util/global.dart';
import '/util/images.dart';
import '/util/strings.dart';
import '/util/textfeild.dart';
import '/util/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/profile_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  bool _switchValue = false;
  XFile? profileImage;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, msgProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(editProfile,
              style: Styles.mediumTextStyle(
                  color: ColorResources.whiteColor, size: 20)),
          iconTheme: const IconThemeData(color: ColorResources.whiteColor),
          backgroundColor: ColorResources.appColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              hSpace(10),
              InkWell(
                onTap: () {
                  showImagePicker(context, (pickedImage) {
                    setState(() {
                      profileImage = pickedImage;
                    });
                  });
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    profileImage == null
                        ? const CircleAvatar(
                            radius: 63,
                            backgroundColor: ColorResources.appColor,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: ColorResources.whiteColor,
                              backgroundImage: AssetImage(Images.dummyUser),
                            ),
                          )
                        : CircleAvatar(
                            radius: 63,
                            backgroundColor: ColorResources.appColor,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: ColorResources.whiteColor,
                              backgroundImage:
                                  FileImage(File(profileImage!.path)),
                            ),
                          ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorResources.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: CircleAvatar(
                            backgroundColor: ColorResources.appColor,
                            child: Icon(Icons.edit,
                                color: ColorResources.whiteColor, size: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildTextWithBorderField(
                          nameCtrl,
                          name,
                          MediaQuery.of(context).size.width,
                          50,
                          TextInputType.text),
                      hSpace(15),
                      buildTextWithBorderField(
                          emailCtrl,
                          emailAddress,
                          MediaQuery.of(context).size.width,
                          50,
                          TextInputType.emailAddress),
                      hSpace(15),
                      buildTextWithBorderField(
                          numberCtrl,
                          phoneNumber,
                          MediaQuery.of(context).size.width,
                          50,
                          TextInputType.number),
                      hSpace(25),
                      Text(
                        security,
                        style: Styles.mediumTextStyle(
                            size: 16, color: ColorResources.blackColor),
                      ),
                      hSpace(15),
                      buildTextWithBorderField(
                          passwordCtrl,
                          password,
                          MediaQuery.of(context).size.width,
                          50,
                          TextInputType.text,
                          postfixIcon: const Icon(Icons.shield_outlined,
                              color: ColorResources.appColor)),
                      hSpace(15),
                      buildTextWithBorderField(
                          confirmPasswordCtrl,
                          confirmPassword,
                          MediaQuery.of(context).size.width,
                          50,
                          TextInputType.text,
                          postfixIcon: const Icon(Icons.shield_outlined,
                              color: ColorResources.appColor)),
                      hSpace(25),
                      Text(
                        privacy,
                        style: Styles.mediumTextStyle(
                            size: 16, color: ColorResources.blackColor),
                      ),
                      hSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(thirdPartyData,
                              style: Styles.mediumTextStyle(
                                  size: 16,
                                  color: ColorResources.blackColor
                                      .withOpacity(0.6))),
                          Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              activeColor: ColorResources.appColor,
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      hSpace(15),
                      customButton(() {}, deleteAccount, 50, '', context,
                          color: ColorResources.whiteColor,
                          txtColor: ColorResources.appColor,
                          borderColor: ColorResources.borderColor,
                          height: 50),
                      hSpace(10),
                      customButton(() {}, saveChanges, 50, '', context,
                          color: ColorResources.appColor,
                          txtColor: ColorResources.whiteColor,
                          borderColor: ColorResources.borderColor,
                          height: 50)
                    ]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
