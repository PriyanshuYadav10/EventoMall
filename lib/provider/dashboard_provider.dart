

import 'package:flutter/material.dart';

import '../repo/dashboard_repo.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardRepo dashboardRepo;
  DashboardProvider({required this.dashboardRepo});

  bool _isLoading = false;



  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  void updateIndex(int pageIndex){
    _selectedPageIndex = pageIndex;
    notifyListeners();
  }



}