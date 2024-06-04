import '/Screens/profile/editProfile.dart';
import '/util/button.dart';
import '/util/color_resources.dart';
import '/util/global.dart';
import '/util/images.dart';
import '/util/strings.dart';
import '/util/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../provider/profile_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, msgProvider, child) {
      return Scaffold(
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120, left: 20, right: 20,bottom: 50),
                  decoration: BoxDecoration(
                      color: ColorResources.appColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text('Elvina Kolvish',
                                    style: Styles.mediumTextStyle(
                                        color: ColorResources.whiteColor,
                                        size: 19))),
                            hSpace(15),
                            Text(name, style: Styles.mediumTextStyle(
                                color: ColorResources.whiteColor, size: 17)),
                            hSpace(8),
                            Text('Elvina Kolvish', style: Styles.regularTextStyle(
                                color: ColorResources.whiteColor, size: 16)),
                            hSpace(10),
                            const Divider(
                              height: 1,
                              color: ColorResources.whiteColor,
                            ),
                            hSpace(12),
                            Text(emailAddress, style: Styles.mediumTextStyle(
                                color: ColorResources.whiteColor, size: 17)),
                            hSpace(8),
                            Text('elvinakonvish123@gmail.com',
                                style: Styles.regularTextStyle(
                                    color: ColorResources.whiteColor, size: 16)),
                            hSpace(10),
                            const Divider(
                              height: 1,
                              color: ColorResources.whiteColor,
                            ),
                            hSpace(12),
                            Text(phoneNumber, style: Styles.mediumTextStyle(
                                color: ColorResources.whiteColor, size: 17)),
                            hSpace(8),
                            Text('+91 123 456 7890',
                                style: Styles.regularTextStyle(
                                    color: ColorResources.whiteColor, size: 16)),
                            hSpace(10),
                            const Divider(
                              height: 1,
                              color: ColorResources.whiteColor,
                            ),
                            hSpace(30),
                            customButton(() {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditProfile()));
                            }, editProfile, 50, '', context,
                                color: ColorResources.whiteColor,
                                txtColor: ColorResources.appColor,
                                borderColor: ColorResources.borderColor,
                                height: 50),
                            hSpace(15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: ColorResources.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(Images.dummyUser),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    );
  }
}