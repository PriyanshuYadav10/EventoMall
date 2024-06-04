import '/util/color_resources.dart';
import '/util/global.dart';
import '/util/images.dart';
import '/util/textfeild.dart';
import '/util/textstyles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_provider.dart';
import '../../../util/strings.dart';
import '../../filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: buildTextWithBorderField(searchCtrl, searchHere,
                MediaQuery.of(context).size.width, 50, TextInputType.text,postfixIcon: InkWell(
                   onTap: (){
                     Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const FilterScreen()));
                   }, child: const Icon(Icons.filter_alt_rounded))),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              hSpace(15),
              CarouselSlider.builder(
                itemCount: 10,
                options: CarouselOptions(
                  padEnds: false,
                  height: height * 0.12,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.22,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                ),
                itemBuilder: (context, i, id) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: i % 2 == 0
                              ? ColorResources.appColor
                              : const Color(0xffEF847F),
                        ),
                        child: Image.asset(Images.dummyCar1),
                      ),
                      Text(
                        'Cabriolet',
                        style: Styles.mediumTextStyle(
                            size: 12,
                            color: ColorResources.blackColor.withOpacity(0.8)),
                      )
                    ],
                  );
                },
              ),
              hSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    popular,
                    style: Styles.mediumTextStyle(
                        size: 16, color: ColorResources.blackColor),
                  ),
                  vSpace(5),
                  InkWell(
                      onTap: () {
                      },
                      child: Text(
                        seeAll,
                        style: Styles.mediumTextStyle(
                            size: 16, color: ColorResources.appColor),
                      )),
                ],
              ),
              hSpace(8),
              CarouselSlider.builder(
                itemCount: 10,
                options: CarouselOptions(
                  padEnds: false,
                  height:200,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  // viewportFraction: 0.22,
                  // aspectRatio: 2.0,
                  enlargeCenterPage: false,
                ),
                itemBuilder: (context, i, id) {
                  return InkWell(
                    onTap: () {
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: ColorResources.borderColor),
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                      color: ColorResources.whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: ColorResources.containerBgColor1,
                                ),
                                child: Image.asset(
                                  Images.dummyCar2,
                                  height: 90,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (homeProvider.addStarred1.contains(i)) {
                                      homeProvider.addStarred1.remove(
                                          i); // Remove from the list if already starred
                                    } else {
                                      homeProvider.addStarred1.add(
                                          i); // Add to the list if not already starred
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorResources.whiteColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    homeProvider.addStarred1.contains(i)
                                        ? Icons.favorite
                                        : Icons.favorite_outline_rounded,
                                    color: ColorResources.appColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 5),
                            child: Text(
                              'Chevrolet Suburban 2021',
                              style: Styles.mediumTextStyle(
                                  size: 15, color: ColorResources.blackColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(Images.fuel, height: 18),
                                        vSpace(5),
                                        Text(
                                          'Petrol',
                                          style: Styles.regularTextStyle(
                                              size: 14,
                                              color: ColorResources.blackColor
                                                  .withOpacity(0.7)),
                                        ),
                                      ],
                                    ),
                                    vSpace(10),
                                    Row(
                                      children: [
                                        Image.asset(Images.owner, height: 18),
                                        vSpace(5),
                                        Text(
                                          '1st',
                                          style: Styles.regularTextStyle(
                                              size: 14,
                                              color: ColorResources.blackColor
                                                  .withOpacity(0.7)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(Images.gear, height: 18),
                                    vSpace(5),
                                    Text(
                                      'Auto',
                                      style: Styles.regularTextStyle(
                                          size: 14,
                                          color: ColorResources.blackColor
                                              .withOpacity(0.7)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Text(
                              '\$ 27000',
                              style: Styles.mediumTextStyle(
                                  size: 16,
                                  color: ColorResources.blackColor
                                      .withOpacity(0.8)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              hSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recommended,
                    style: Styles.mediumTextStyle(
                        size: 16, color: ColorResources.blackColor),
                  ),
                  vSpace(5),
                  InkWell(
                      onTap: () {
                      },
                      child: Text(
                        seeAll,
                        style: Styles.mediumTextStyle(
                            size: 16, color: ColorResources.appColor),
                      )),
                ],
              ),
              hSpace(8),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: ColorResources.borderColor),
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 0,
                        color: ColorResources.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    color: ColorResources.containerBgColor1,
                                  ),
                                  child: Image.asset(
                                    Images.dummyCar2,
                                    height: 120,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (homeProvider.addStarred2
                                          .contains(index)) {
                                        homeProvider.addStarred2.remove(
                                            index); // Remove from the list if already starred
                                      } else {
                                        homeProvider.addStarred2.add(
                                            index); // Add to the list if not already starred
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorResources.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      homeProvider.addStarred2.contains(index)
                                          ? Icons.favorite
                                          : Icons.favorite_outline_rounded,
                                      color: ColorResources.appColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 0, 5),
                              child: Text(
                                'Chevrolet Suburban 2021',
                                style: Styles.mediumTextStyle(
                                    size: 15, color: ColorResources.blackColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(Images.fuel, height: 18),
                                          vSpace(5),
                                          Text(
                                            'Petrol',
                                            style: Styles.regularTextStyle(
                                                size: 14,
                                                color: ColorResources.blackColor
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      ),
                                      vSpace(10),
                                      Row(
                                        children: [
                                          Image.asset(Images.owner, height: 18),
                                          vSpace(5),
                                          Text(
                                            '1st',
                                            style: Styles.regularTextStyle(
                                                size: 14,
                                                color: ColorResources.blackColor
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(Images.gear, height: 18),
                                      vSpace(5),
                                      Text(
                                        'Auto',
                                        style: Styles.regularTextStyle(
                                            size: 14,
                                            color: ColorResources.blackColor
                                                .withOpacity(0.7)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$ 27000',
                                    style: Styles.mediumTextStyle(
                                        size: 16,
                                        color: ColorResources.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  Row(
                                    children: [
                                      Text(view,
                                          style: Styles.regularTextStyle(
                                              size: 14,
                                              color:
                                                  ColorResources.appColor)),
                                      vSpace(5),
                                      const Icon(Icons.arrow_forward,
                                          color: ColorResources.appColor,
                                          size: 14),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      );
    });
  }
}
