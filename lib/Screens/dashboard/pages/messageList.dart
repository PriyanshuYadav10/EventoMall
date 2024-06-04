// import '/Screens/message/messages.dart';
// import '/util/color_resources.dart';
// import '/util/global.dart';
// import '/util/textstyles.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../util/images.dart';
// import '../../../util/strings.dart';
// import '../../../util/textfeild.dart';
//
// class MessageList extends StatefulWidget {
//   const MessageList({super.key});
//
//   @override
//   State<MessageList> createState() => _MessageListState();
// }
//
// class _MessageListState extends State<MessageList> {
//   TextEditingController searchCtrl = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MsgProvider>(builder: (context, msgProvider, child) {
//       return Scaffold(
//           appBar: AppBar(
//             flexibleSpace: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: buildTextWithBorderField(searchCtrl, searchHere,
//                   MediaQuery
//                       .of(context)
//                       .size
//                       .width, 50, TextInputType.text),
//             ),
//           ),
//           body: ListView.builder(
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   splashColor: ColorResources.appColor,
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Messages()));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
//                     child: Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 25,
//                           backgroundImage: AssetImage(Images.dummyUser),
//                         ),
//                         vSpace(10),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Rolex cef',style: Styles.mediumTextStyle(),),
//                             hSpace(2),
//                             Text('Lorem ipsum dummy text all of...',style: Styles.regularTextStyle(color:ColorResources.blackColor.withOpacity(0.6)),),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               })
//       );
//     });
//   }
// }
