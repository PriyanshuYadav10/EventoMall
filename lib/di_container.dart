import '/provider/dashboard_provider.dart';
import '/provider/home_provider.dart';
import '/provider/profile_provider.dart';
import '/repo/dashboard_repo.dart';
import '/repo/home_repo.dart';
import '/repo/profile_repo.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'helper/network_info.dart';
import 'provider/auth_provider.dart';
import 'repo/auth_repo.dart';

final sl = GetIt.instance;


Future<void> init() async {
  // Core

  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient( sl(), loggingInterceptor: sl(),
      sharedPreferences: sl()));


  //Repository
  sl.registerLazySingleton(() => DashboardRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(dioClient: sl()));




  // Provider

  sl.registerFactory(() => DashboardProvider(dashboardRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));




  // // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());




  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(),));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
}