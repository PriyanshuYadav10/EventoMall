import '/util/color_resources.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../util/button.dart';
import '../../util/global.dart';
import '../../util/images.dart';
import '../../util/strings.dart';
import '../../util/textstyles.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final CarouselController _controller = CarouselController();
  int totalImages = 0;
List colorList= [
  const Color(0xFFEE7242),
  const Color(0xff3C60D8),
  const Color(0xFFFB9E17),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(choosePackage, context,color:ColorResources.secondaryAppColor),
      backgroundColor: ColorResources.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.membershipBg),fit: BoxFit.cover)
        ),
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              carouselController: _controller,
              options: CarouselOptions(
                height: 260,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.85,
                onPageChanged: (index, reason){
                  setState(() {
                    totalImages = index;
                  });
                },
                enlargeCenterPage: false,
              ),
              itemBuilder: (context, i, id) {
                return  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResources.whiteColor,
                      // border: Border.all(color: ColorResources.borderColor)
                  ),
                  margin: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:const EdgeInsets.all(12),
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                          color: colorList[i],
                        ),
                        width:MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Standard',style: Styles.mediumTextStyle(size: 18,color: ColorResources.whiteColor)),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: ColorResources.borderColor)
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child:Text('\$44',style: Styles.mediumTextStyle(size: 17),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text("What's included?",style: Styles.semiBoldTextStyle(size: 16),),
                      ),
                      Divider(color: ColorResources.blackColor.withOpacity(0.3),height: 0.5,),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                              child: Row(
                                children: [
                                  const Icon(Icons.check,color:ColorResources.appColor),
                                  vSpace(5),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text('Strong privacy and fraud protection to help keep you safe',
                                        overflow: TextOverflow.visible,
                                        style: Styles.lightTextStyle(color: ColorResources.blackColor.withOpacity(0.6))),
                                  ),
                                ],
                              )
                            );
                          }),
                    ],
                  ),
                );
              },
            ),
            hSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (['er','er','er'] ?? [])
                  .asMap()
                  .entries
                  .map((entry) {
                print(entry);
                print(entry.key);
                return GestureDetector(
                  onTap: () =>
                      _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(10),
                      color: totalImages == entry.key?ColorResources.indicatorColor:ColorResources.appColor),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: customButton(() {

              }, choosePackage, 25, '', context,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ColorResources.whiteColor,
                  txtColor: ColorResources.appColor,
                  borderColor: ColorResources.appColor),
            ),
          ],
        ),
      ),
    );
  }
}
