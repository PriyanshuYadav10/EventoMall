
import '/util/color_resources.dart';
import '/util/images.dart';
import '/util/strings.dart';
import '/util/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'button.dart';
import 'dashboard_model.dart';

Widget vSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget hSpace(double space) {
  return SizedBox(
    height: space,
  );
}

commonAppBar(title,context, {Color? color}) {
  return AppBar(
    backgroundColor: color ?? ColorResources.whiteColor ,
    iconTheme: IconThemeData(
      color:  color == null ?ColorResources.blackColor:ColorResources.whiteColor
    ),
    title: Text(title,style: Styles.mediumTextStyle(color: color == null ?ColorResources.blackColor:ColorResources.whiteColor,size: 21)),
    leading: InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 15.0,right: 15.0),
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    ),
  );
}

List<DashboardModel> sideMenu = [
  DashboardModel(image: const AssetImage(Images.carValue), title: carValuation, id: 1),
  DashboardModel(image: const AssetImage(Images.chat), title: favourites, id: 2),
  DashboardModel(image: const AssetImage(Images.category), title: category, id: 3),
  DashboardModel(image: const AssetImage(Images.addCar), title: addCar, id: 4),
  DashboardModel(image: const AssetImage(Images.bookmark), title: manageAd, id: 5),
  DashboardModel(image: const AssetImage(Images.membership), title: membership, id: 6),
  DashboardModel(image: const AssetImage(Images.profile), title: profile, id:7),
];


commonBottomSheet(title, data, dataCtrl,context) async {
  double itemHeight = 50.0; // Set your desired height for each item
  double maxHeight = MediaQuery.of(context).size.height *
      0.75; // Set the maximum height for the bottom sheet

  int itemCount = data.length;
  double calculatedHeight = itemHeight * itemCount;

  double sheetHeight =
  calculatedHeight > maxHeight ? maxHeight : calculatedHeight;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return  StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: sheetHeight + 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: ColorResources.appColor, // Use your app's primary color here
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              data[index].toString();
                              dataCtrl.text = data[index];
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              // Remove fixed height and width properties
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black26, blurRadius: 2.5)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                child: Text(
                                  data[index].toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                  ),
                ),
              ],
            ),
          );
        }
      );
    },
  );
}


Future<void> pickImages(BuildContext context,path) async {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> pickedFiles = await _picker.pickMultiImage();
  if (pickedFiles != null) {
    if(path == planning) {
      // final selectedImagesProvider =
      // Provider.of<SellCarProvider>(context, listen: false);
      // // selectedImagesProvider.addImage(pickedFiles.first); // Add the first image for demo (adjust as needed)
      // for (final image in pickedFiles) {
      //   selectedImagesProvider.addImage(image);
      // }
    }
    if(path == planning) {
      // final selectedImagesProvider =
      // Provider.of<SellCarProvider>(context, listen: false);
      // selectedImagesProvider.clearImages();
      // // selectedImagesProvider.addImage(pickedFiles.first); // Add the first image for demo (adjust as needed)
      // for (final image in pickedFiles) {
      //   selectedImagesProvider.addImage(image);
      // }
    }else if(path == createAd){
      // final selectedImagesProvider =
      // Provider.of<AdProvider>(context, listen: false);
      // // selectedImagesProvider.addImage(pickedFiles.first); // Add the first image for demo (adjust as needed)
      // for (final image in pickedFiles) {
      //   selectedImagesProvider.addImage(image);
      // }
    }
  }
}

Future<void> pickVinImage(BuildContext context,path) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? pickedFile =
  await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    // if(path == sellCar) {
    //   final selectedImagesProvider =
    //   Provider.of<SellCarProvider>(context, listen: false);
    //   selectedImagesProvider.setVinImage(pickedFile);
    // }
  }
}
Future<void> showImagePicker(
    BuildContext context, Function(XFile?) onImagePicked) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorResources.whiteColor,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customButton(() async {
                    Navigator.of(context).pop();
                    final ImagePicker _picker = ImagePicker();
                    XFile? pickedFile =
                    await _picker.pickImage(source:ImageSource.camera);
                    onImagePicked(pickedFile);
                  }, camera, 25, '', context,
                      height: 50,
                      color: ColorResources.whiteColor,
                      txtColor: ColorResources.appColor),
                  hSpace(15),
                  customButton(() async {
                    Navigator.of(context).pop();
                    final ImagePicker _picker = ImagePicker();
                    XFile? pickedFile =
                    await _picker.pickImage(source:ImageSource.gallery);
                    onImagePicked(pickedFile);
                  }, gallery, 25, '', context,
                      height: 50,
                      color: ColorResources.whiteColor,
                      txtColor: ColorResources.appColor),
                  hSpace(15),
                ],
              ),
            ),
          );
        },
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.linear,
        )),
        child: child,
      );
    },
  );
}
