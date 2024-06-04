import 'package:flutter/material.dart';

import '../repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo homeRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List addStarred1 = [];
  List addStarred2 = [];
  // bool _isFavorite = false;
  //
  // bool get isFavorite => _isFavorite;
  //
  // void updateFavList(){
  //   _isFavorite = !_isFavorite;
  //   notifyListeners();
  // }

  // List<Category> categories = [];







  HomeProvider({required this.homeRepo});
  bool isError = false;


  // Future getBanners() async {
  //   _isLoading = false;
  //   notifyListeners();
  //   ApiResponse apiResponse = await homeRepo.getBanners();
  //   _isLoading = true;
  //   notifyListeners();
  //   if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
  //     var resp = BannerListResponse.fromMap(apiResponse.response?.data);
  //
  //     banners.clear();
  //     banners.addAll(resp.banners);
  //
  //     notifyListeners();
  //   } else {
  //     print(apiResponse.error);
  //     String errorMessage;
  //     if (apiResponse.error is String) {
  //       print(apiResponse.error.toString());
  //       errorMessage = apiResponse.error.toString();
  //     } else {
  //       errorMessage = "Error While Checking";
  //     }
  //   }
  // }


}
