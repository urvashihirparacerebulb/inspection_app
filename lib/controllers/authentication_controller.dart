import 'dart:convert';
import 'package:get/get.dart';
import 'package:inspection_app/modules/dashboard/dashboard_screen.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;

import '../model/boolean_response_model.dart';
import '../model/login_response_model.dart';
import '../utility/common_methods.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get to => Get.find();

  void loginAPI(Map<String, dynamic> params) {
    apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.loginURL,
      success: (dio.Response<dynamic> response) {
        LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(response.data));
        setObject(ApiConfig.loginPref, loginResponseModel);
        setIsLogin(isLogin: true);
        Get.offAll(() => const DashboardScreen());
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}

void errorHandling(dio.Response<dynamic> response) {
  BooleanResponseModel? responseData =
  BooleanResponseModel.fromJson(jsonDecode(response.data));
  showSnackBar(title: ApiConfig.error, message: responseData.message ?? "");
}