import '/Screens/dashboard/pages/buy_car.dart';
import '/Screens/dashboard/pages/home.dart';
import '/Screens/dashboard/pages/messageList.dart';
import '/Screens/dashboard/pages/profile.dart';
import '/Screens/dashboard/pages/sell_car.dart';
import '/util/global.dart';
import '/util/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../util/color_resources.dart';
import '../../provider/dashboard_provider.dart';
import '../../util/images.dart';
import '../../util/strings.dart';
import '../membership/membership.dart';
import '../notification/notification.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    // BuyCar(),
    // const MessageList(),
    // const SellCar(),
    const Profile(),
  ];

  static final List<String> _titleName = [
    home,
    buyCar,
    message,
    sellCar,
    profile
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() {
    // Provider.of<AuthProvider>(context,listen: false).updateToken(context);
    // Provider.of<HomeProvider>(context,listen: false).getBanners();
    // Provider.of<HomeProvider>(context,listen: false).getCategories();
    // Provider.of<HomeProvider>(context,listen: false).getHomeProducts();
    // Provider.of<ProfileProvider>(context,listen: false).getUserProfile().then((value) {
    //   if(value==0){
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    //   }
    // });
  }

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Provider.of<DashboardProvider>(context, listen: false)
                      .selectedPageIndex ==
                  0
              ? home
              : Provider.of<DashboardProvider>(context, listen: false)
                          .selectedPageIndex ==
                      1
                  ? buyCar
                  : Provider.of<DashboardProvider>(context, listen: false)
                              .selectedPageIndex ==
                          2
                      ? message
                      : Provider.of<DashboardProvider>(context, listen: false)
                                  .selectedPageIndex ==
                              3
                          ? sellCar
                          : profile),
          backgroundColor: ColorResources.whiteColor,
          leading: Builder(
            builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Image.asset(Images.drawer),
              ),
            ),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                child: const Icon(Icons.notifications_none_rounded)),
            vSpace(15),
            InkWell(
                onTap: () {

                },
                child: const Icon(Icons.favorite_outline_rounded)),
            vSpace(15),
            Visibility(
              visible: Provider.of<DashboardProvider>(context, listen: false)
                      .selectedPageIndex ==
                  3,
              child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: ColorResources.borderColor)),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.add_circle_rounded,
                      color: ColorResources.appColor,
                    ),
                  )),
            ),
            vSpace(15)
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(
              Provider.of<DashboardProvider>(context, listen: false)
                  .selectedPageIndex),
        ),
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: ColorResources.whiteColor,
            child:  MainDrawerWidget(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorResources.appColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(Images.home,
                  height: 24,
                  color: Provider.of<DashboardProvider>(context, listen: true)
                              .selectedPageIndex ==
                          0
                      ? ColorResources.blackColor
                      : ColorResources.whiteColor),
              label: _titleName[0],
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Images.car,
                  height: 24,
                  color: Provider.of<DashboardProvider>(context, listen: true)
                              .selectedPageIndex ==
                          1
                      ? ColorResources.blackColor
                      : ColorResources.whiteColor),
              label: _titleName[1],
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Images.chat,
                  height: 24,
                  color: Provider.of<DashboardProvider>(context, listen: true)
                              .selectedPageIndex ==
                          2
                      ? ColorResources.blackColor
                      : ColorResources.whiteColor),
              label: _titleName[2],
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Images.key,
                  height: 24,
                  color: Provider.of<DashboardProvider>(context, listen: true)
                              .selectedPageIndex ==
                          3
                      ? ColorResources.blackColor
                      : ColorResources.whiteColor),
              label: _titleName[3],
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Images.profile,
                  height: 24,
                  color: Provider.of<DashboardProvider>(context, listen: true)
                              .selectedPageIndex ==
                          4
                      ? ColorResources.blackColor
                      : ColorResources.whiteColor),
              label: _titleName[4],
            ),
          ],
          currentIndex: Provider.of<DashboardProvider>(context, listen: true)
              .selectedPageIndex,
          selectedItemColor: ColorResources.blackColor,
          unselectedItemColor: ColorResources.whiteColor,
          showUnselectedLabels: true,
          onTap: (index) =>
              Provider.of<DashboardProvider>(context, listen: false)
                  .updateIndex(index),
        ));
  }

  Widget MainDrawerWidget(){
    return Container(
      color: ColorResources.whiteColor,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.drawerImg),fit: BoxFit.fill)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          Provider.of<DashboardProvider>(context, listen: false)
                              .updateIndex(4);
                        },
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 23,
                              backgroundImage: AssetImage(Images.dummyUser),
                            ),
                            vSpace(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ealvina Kolvish',style: Styles.mediumTextStyle(color: ColorResources.whiteColor,size: 15)),
                                Text('name123@gmail.com',style: Styles.regularTextStyle(size: 15,color:ColorResources.whiteColor.withOpacity(0.8)),),
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          child:  const Icon(Icons.close_rounded,color: ColorResources.appColor),
                        ),
                      )
                    ],
                  ),
                  hSpace(20),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Divider(color: ColorResources.whiteColor,height: 1),
                  ),
                  hSpace(30),
                  Padding(
                    padding: const EdgeInsets.only(right: 15,bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(Images.bookmark,color: ColorResources.blackColor,height: 25,),
                              ),
                            ),
                            hSpace(5),
                            Text(placeAnAd,style: Styles.mediumTextStyle(size: 12,color: ColorResources.whiteColor))
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                                Provider.of<DashboardProvider>(context, listen: false)
                                    .updateIndex(1);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(Images.car,color: ColorResources.blackColor,height: 25,),
                              ),
                            ),
                            hSpace(5),
                            Text(buyCar,style: Styles.mediumTextStyle(size: 12,color: ColorResources.whiteColor))
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                              Navigator.of(context).pop();
                              Provider.of<DashboardProvider>(context, listen: false)
                                  .updateIndex(3);
                            },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(Images.key,color: ColorResources.blackColor,height: 25,),
                              ),
                            ),
                            hSpace(5),
                            Text(sellCar,style: Styles.mediumTextStyle(size: 12,color: ColorResources.whiteColor))
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: const EdgeInsets.all(15),
                                child:  Image.asset(Images.heart,color: ColorResources.blackColor,height: 25,),
                              ),
                            ),
                            hSpace(5),
                            Text(saved,style: Styles.mediumTextStyle(size: 12,color: ColorResources.whiteColor))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (var i = 0; i < sideMenu.length; i++)
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedindex = i;
                });
                if(selectedindex == 0){

                }else if(selectedindex == 1){
                  Provider.of<DashboardProvider>(context, listen: false)
                      .updateIndex(2);
                }else if(selectedindex == 3){
                }else if(selectedindex == 4){
                }else if(selectedindex == 5){
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const Membership()));
                }else if(selectedindex == 6){
                  Provider.of<DashboardProvider>(context, listen: false)
                      .updateIndex(4);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: selectedindex == i?ColorResources.appColor:Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 8),
                child: Row(
                  children: [
                    Image(
                      image: sideMenu[i].image,
                      height: 25,
                      color:selectedindex == i ? ColorResources.whiteColor:ColorResources.blackColor,
                    ),
                    vSpace(10),
                    Text(
                      sideMenu[i].title,
                      style: Styles.mediumTextStyle(
                          color: selectedindex == i ? ColorResources.whiteColor:ColorResources.blackColor, size: 15),
                    )
                  ],
                ),
              ),
            ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Divider(color:ColorResources.blackColor,thickness:0.5),
                ),
                hSpace(10),
                InkWell(
                  splashColor:
                  ColorResources.appColor.withOpacity(0.5),
                  onTap: () {
                    
                  },
                  child: Row(
                    children: [
                      vSpace(15),
                      const Image(
                        image:  AssetImage(Images.logout),
                        height: 25,
                        color: ColorResources.blackColor,
                      ),
                      vSpace(10),
                      Text(
                        "Logout",
                        style: Styles.mediumTextStyle(
                            color: ColorResources.blackColor,
                            size: 16),
                      )
                    ],
                  ),
                ),
                hSpace(35),
              ],
            ),
          )
        ],
      ),
    );
  }
}
