// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../provider/carlist_provider.dart';
// import '../../../util/color_resources.dart';
// import '../../../util/global.dart';
// import '../../../util/images.dart';
// import '../../../util/strings.dart';
// import '../../../util/textstyles.dart';
// import '../../cardetail/cardetails.dart';
//
// class BuyCar extends StatefulWidget {
//   BuyCar({super.key, this.path});
//   String? path;
//   @override
//   State<BuyCar> createState() => _BuyCarState();
// }
//
// class _BuyCarState extends State<BuyCar> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CarListProvider>(
//         builder: (context, carListProvider, child) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child:  ListView.builder(
//             itemCount: 5,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) =>
//                           CarDetailsScreen()));
//                 },
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                           color: ColorResources.borderColor),
//                       borderRadius: BorderRadius.circular(15)),
//                   elevation: 0,
//                   color: ColorResources.whiteColor,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(15),
//                                   topRight: Radius.circular(15)),
//                               color: ColorResources.containerBgColor1,
//                             ),
//                             child: Image.asset(
//                               Images.dummyCar2,
//                               height: 120,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 if (carListProvider.addStarred
//                                     .contains(index)) {
//                                   carListProvider.addStarred.remove(
//                                       index); // Remove from the list if already starred
//                                 } else {
//                                   carListProvider.addStarred.add(
//                                       index); // Add to the list if not already starred
//                                 }
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: ColorResources.whiteColor,
//                                   borderRadius:
//                                   BorderRadius.circular(50)),
//                               padding: const EdgeInsets.all(8.0),
//                               margin: const EdgeInsets.all(8.0),
//                               child: Icon(
//                                 widget.path == 'saved' ? Icons.favorite:
//                                 carListProvider.addStarred.contains(index)
//                                     ? Icons.favorite
//                                     : Icons.favorite_outline_rounded,
//                                 color: ColorResources.appColor,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 2, 0, 5),
//                         child: Text(
//                           'Chevrolet Suburban 2021',
//                           style: Styles.mediumTextStyle(
//                               size: 15, color: ColorResources.blackColor),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Image.asset(Images.fuel, height: 18),
//                                     vSpace(5),
//                                     Text(
//                                       'Petrol',
//                                       style: Styles.regularTextStyle(
//                                           size: 14,
//                                           color: ColorResources.blackColor
//                                               .withOpacity(0.7)),
//                                     ),
//                                   ],
//                                 ),
//                                 vSpace(10),
//                                 Row(
//                                   children: [
//                                     Image.asset(Images.owner, height: 18),
//                                     vSpace(5),
//                                     Text(
//                                       '1st Owner',
//                                       style: Styles.regularTextStyle(
//                                           size: 14,
//                                           color: ColorResources.blackColor
//                                               .withOpacity(0.7)),
//                                     ),
//                                   ],
//                                 ),
//                                 vSpace(10),
//                                 Row(
//                                   children: [
//                                     Image.asset(Images.gear, height: 18),
//                                     vSpace(5),
//                                     Text(
//                                       'Auto Transmission',
//                                       style: Styles.regularTextStyle(
//                                           size: 14,
//                                           color: ColorResources.blackColor
//                                               .withOpacity(0.7)),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               '\$ 27000',
//                               style: Styles.mediumTextStyle(
//                                   size: 16,
//                                   color: ColorResources.blackColor
//                                       .withOpacity(0.8)),
//                             ),
//                             Row(
//                               children: [
//                                 Text(view,
//                                     style: Styles.regularTextStyle(
//                                         size: 14,
//                                         color:
//                                         ColorResources.appColor)),
//                                 vSpace(5),
//                                 const Icon(Icons.arrow_forward,
//                                     color: ColorResources.appColor,
//                                     size: 14),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             })
//       );
//     });
//   }
// }
