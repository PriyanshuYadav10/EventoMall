import '/Screens/auth/sign_up.dart';
import '/util/button.dart';
import '/util/color_resources.dart';
import '/util/global.dart';
import '/util/strings.dart';
import '/util/textfeild.dart';
import '/util/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../util/images.dart';
import '../dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return ListView(
          children: [
           Image.asset(Images.loginBg),
            hSpace(40),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                text: '$welcomeTo ',
                style: Styles.semiBoldTextStyle(size: 25),
                children: [
                  TextSpan(
                      text: appTitle,
                      style: Styles.semiBoldTextStyle(
                          color: ColorResources.appColor, size: 25)),
                ],
              )),
            ),
            hSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
              child: buildTextWithBorderField(loginCtrl,enterYourEmail,
                  MediaQuery.of(context).size.width, 55, TextInputType.emailAddress),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customButton((){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen()));
              }, signIn, 25, '',height: 50, context,color: ColorResources.appColor),
            ),
            hSpace(15),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(Images.signUpWith),
            ),
            hSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(child: Image.asset(Images.fbButton,height: 60)),
                InkWell(child: Image.asset(Images.googleButton,height: 60)),
                InkWell(child: Image.asset(Images.appleButton,height: 60))
              ],
            ),
            hSpace(30),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen()));
              },child: Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(
                      text: '$dontHaveAccount ',
                      style: Styles.regularTextStyle(size: 16),
                      children: [
                        TextSpan(
                            text: signUp,
                            style: Styles.mediumTextStyle(
                                color: ColorResources.appColor, size: 16)),
                      ],
                    )),
              ),
            ),
          ],
        );
      })),
    );
  }
}
