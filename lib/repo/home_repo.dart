import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../data/datasource/remote/dio/dio_client.dart';

class HomeRepo {
  final DioClient dioClient;
  HomeRepo({required this.dioClient});


  // Future<ApiResponse> getBanners() async {
  //   try {
  //     Response response = await dioClient.get(AppConstants.getBanners);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }


}