import '/util/color_resources.dart';
import '/util/textstyles.dart';
import 'package:flutter/material.dart';

import '../../util/global.dart';
import '../../util/images.dart';
import '../../util/strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:commonAppBar(notification, context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: ListView(
          children: [
            Text(today,style: Styles.mediumTextStyle(size: 18),),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorResources.borderColor),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Images.offer,height: 45),
                    vSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vehicle history report',style: Styles.mediumTextStyle(),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Text('Lorem ipsum is a placeholder text commonly used to  of a content.',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.mediumTextStyle(color: ColorResources.blackColor.withOpacity(0.6)),),
                        ),
                        Row(
                          children: [
                            Text(viewDetails,style: Styles.regularTextStyle(size: 15,color: ColorResources.appColor)),
                            vSpace(5),
                            const Icon(Icons.arrow_forward,color: ColorResources.appColor,size: 15),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
