// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../util/color_resources.dart';
// import '../../../util/global.dart';
// import '../../../util/images.dart';
// import '../../../util/strings.dart';
// import '../../../util/textstyles.dart';
//
// class SellCar extends StatefulWidget {
//   const SellCar({super.key});
//
//   @override
//   State<SellCar> createState() => _SellCarState();
// }
//
// class _SellCarState extends State<SellCar> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SellCarProvider>(
//         builder: (context, sellCarProvider, child) {
//           return Scaffold(
//             body:  Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child:  ListView.builder(
//                     itemCount: 5,
//                     physics: const BouncingScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(CupertinoPageRoute(
//                               builder: (BuildContext context) =>
//                                   CarDetailsScreen(path: sellCar)));
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(
//                                   color: ColorResources.borderColor),
//                               borderRadius: BorderRadius.circular(15)),
//                           elevation: 0,
//                           color: ColorResources.whiteColor,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15, vertical: 10),
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(15),
//                                       topRight: Radius.circular(15)),
//                                   color: ColorResources.containerBgColor1,
//                                 ),
//                                 child: Image.asset(
//                                   Images.dummyCar2,
//                                   height: 120,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(10, 2, 0, 5),
//                                 child: Text(
//                                   'Chevrolet Suburban 2021',
//                                   style: Styles.mediumTextStyle(
//                                       size: 15, color: ColorResources.blackColor),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Image.asset(Images.fuel, height: 18),
//                                             vSpace(5),
//                                             Text(
//                                               'Petrol',
//                                               style: Styles.regularTextStyle(
//                                                   size: 14,
//                                                   color: ColorResources.blackColor
//                                                       .withOpacity(0.7)),
//                                             ),
//                                           ],
//                                         ),
//                                         vSpace(10),
//                                         Row(
//                                           children: [
//                                             Image.asset(Images.owner, height: 18),
//                                             vSpace(5),
//                                             Text(
//                                               '1st Owner',
//                                               style: Styles.regularTextStyle(
//                                                   size: 14,
//                                                   color: ColorResources.blackColor
//                                                       .withOpacity(0.7)),
//                                             ),
//                                           ],
//                                         ),
//                                         vSpace(10),
//                                         Row(
//                                           children: [
//                                             Image.asset(Images.gear, height: 18),
//                                             vSpace(5),
//                                             Text(
//                                               'Auto Transmission',
//                                               style: Styles.regularTextStyle(
//                                                   size: 14,
//                                                   color: ColorResources.blackColor
//                                                       .withOpacity(0.7)),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       '\$ 27000',
//                                       style: Styles.mediumTextStyle(
//                                           size: 16,
//                                           color: ColorResources.blackColor
//                                               .withOpacity(0.8)),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(50),
//                                               border: Border.all(color: ColorResources.borderColor)
//                                           ),
//                                           padding: const EdgeInsets.all(8),
//                                           child: const Icon(Icons.mode_edit_outline_outlined,color: ColorResources.appColor,size: 13),
//                                         ),
//                                         vSpace(10),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(50),
//                                               border: Border.all(color: ColorResources.borderColor)
//                                           ),
//                                           padding: const EdgeInsets.all(8),
//                                           child: const Icon(Icons.delete_outline_rounded,color: ColorResources.appColor,size: 13),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     })
//             ),
//           );
//         });
//   }
// }
