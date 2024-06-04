import '/repo/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});


  bool _isLoading = false;

  bool get isLoading => _isLoading;


  bool _passwordInVisible = true;

  bool get passwordInVisible => _passwordInVisible;

  void updatePasswordVisibility(){
    _passwordInVisible = !_passwordInVisible;
    notifyListeners();
  }

  // Future saveToken(String token) async{
  //   authRepo.saveUserToken(token);
  // }
  //
  // Future savePreferenceData(String key,String data) async{
  //   authRepo.setPreferenceData(key,data);
  // }
  //
  // String getPreferenceData(String key) {
  //   return authRepo.getPreferenceData(key);
  // }


  //
  // String getUserToken() {
  //   return authRepo.getUserToken();
  // }
  //
  // bool isLoggedIn() {
  //   return authRepo.isLoggedIn();
  // }
  //
  // Future<bool> clearSharedData() async {
  //   return await authRepo.clearSharedData();
  // }
  //
  // bool isOnBoardingEnabled(){
  //   return authRepo.isOnBoardingEnable();
  // }
  //
  // Future<void> disableOnBoarding() async{
  //   authRepo.disableOnBoarding();
  // }


}