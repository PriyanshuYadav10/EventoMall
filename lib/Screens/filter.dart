import '/util/color_resources.dart';
import '/util/global.dart';
import '/util/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/button.dart';
import '../util/images.dart';
import '../util/strings.dart';
import '../util/textfeild.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController modelCtrl = TextEditingController();
  TextEditingController bodyTypeCtrl = TextEditingController();
  TextEditingController fuelTypeCtrl = TextEditingController();
  TextEditingController transmissionCtrl = TextEditingController();
  TextEditingController engineCtrl = TextEditingController();
  TextEditingController seatsCtrl = TextEditingController();

  double start = 600000.0;
  double end = 3000000.0;
  static final List<String> dropDownData = <String>[
    'test 1',
    'test 2',
    'test 3',
    'test 4',
    'test 5',
  ];
  List colorList= [
    const Color(0xff3C60D8),
    const Color(0xFFFE9503),
    const Color(0xFFD20303),
    const Color(0xFF000000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(filter, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price (\$)',style: Styles.semiBoldTextStyle(size: 17)),
              hSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${start.toStringAsFixed(2)}',style: Styles.mediumTextStyle(size: 16)),
                  Text('\$${end.toStringAsFixed(2)}',style: Styles.mediumTextStyle(size: 16)),
                ],
              ),
              RangeSlider(
              activeColor:ColorResources.appColor,
                inactiveColor: ColorResources.containerBgColor1,
                values: RangeValues(start, end),
                labels: RangeLabels(start.toString(), end.toString()),
                onChanged: (value) {
                  setState(() {
                    start = value.start;
                    end = value.end;
                  });
                },
                min: 50000.0,
                max: 5000000.0,
              ),
              hSpace(15),
              Text('Brands',style: Styles.semiBoldTextStyle(size: 17)),
              hSpace(5),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.9,
                    mainAxisSpacing: 0.9,
                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index % 2 == 0
                                ? ColorResources.appColor
                                : const Color(0xffEF847F),
                          ),
                          child: Image.asset(Images.dummyCar1),
                        ),
                        Text(
                          'Cabriolet',
                          style: Styles.mediumTextStyle(
                              size: 15,
                              color: ColorResources.blackColor.withOpacity(0.8)),
                        )
                      ],
                    );
                },
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Model', dropDownData, modelCtrl, context);
                },
                child: buildTextWithBorderField(modelCtrl, 'Model',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Body types', dropDownData, bodyTypeCtrl, context);
                },
                child: buildTextWithBorderField(bodyTypeCtrl, 'Body types',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Fuel Type', dropDownData, fuelTypeCtrl, context);
                },
                child: buildTextWithBorderField(fuelTypeCtrl, 'Fuel Type',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Transmission', dropDownData, transmissionCtrl, context);
                },
                child: buildTextWithBorderField(transmissionCtrl, 'Transmission',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Engine', dropDownData, engineCtrl, context);
                },
                child: buildTextWithBorderField(engineCtrl, 'Engine',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(10),
              InkWell(
                onTap: () {
                  commonBottomSheet(
                      'Car Seats', dropDownData, seatsCtrl, context);
                },
                child: buildTextWithBorderField(seatsCtrl, 'Car Seats',
                    MediaQuery.of(context).size.width, 50, TextInputType.text,
                    isEnabled: false,
                    postfixIcon:
                    const Icon(Icons.keyboard_arrow_down_rounded)),
              ),
              hSpace(15),
              Text('Color',style: Styles.semiBoldTextStyle(size: 17)),
              hSpace(5),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: colorList[index],
                    ),
                  );
                }),
              ),
              hSpace(30),
              customButton(() {

              }, reset, 25, '', context,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: ColorResources.appColor,
                  txtColor: ColorResources.whiteColor,
                  borderColor: ColorResources.appColor),
              hSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
