import 'dart:convert';

import 'package:get/get.dart';
import 'package:inspection_app/utility/common_methods.dart';

import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;

import '../model/inspection_response_model.dart';
import 'authentication_controller.dart';

class InspectionController extends GetxController {
  static InspectionController get to => Get.find();

  RxList<InspectionForm> inspectionList = RxList<InspectionForm>();
  RxList<InspectionForm> inProgressInspectionList = RxList<InspectionForm>();
  RxList<InspectionForm> completedInspectionList = RxList<InspectionForm>();
  RxBool isInspectionLoading = false.obs;
  RxList<FormDetail> selectedFormDetail = RxList<FormDetail>();

  void fetchInspectionList({String? startDate,endDate}) {
    apiServiceCall(
      params: {
        "manage_user_id": getLoginData()!.data?.erpId,
        "start_date": startDate,
        "end_date": endDate
      },
      serviceUrl: ApiConfig.fetchInspectionFormURL,
      success: (dio.Response<dynamic> response) {
        InspectionFormsResponseModel inspectionFormsResponseModel = InspectionFormsResponseModel.fromJson(jsonDecode(response.data));
        inspectionList.value = inspectionFormsResponseModel.data?.data ?? [];
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void fetchCompletedInspectionList() {
    apiServiceCall(
      params: {
        "manage_user_id": getLoginData()!.data?.erpId
      },
      serviceUrl: ApiConfig.fetchCompletedInspectionFormURL,
      success: (dio.Response<dynamic> response) {
        InspectionListResponseModel inspectionFormsResponseModel = InspectionListResponseModel.fromJson(jsonDecode(response.data));
        completedInspectionList.value = inspectionFormsResponseModel.data ?? [];
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: false,
      methodType: ApiConfig.methodPOST,
    );
  }

  void fetchInProgressInspectionList() {
    isInspectionLoading.value = true;
    apiServiceCall(
      params: {
        "manage_user_id": getLoginData()!.data?.erpId
      },
      serviceUrl: ApiConfig.fetchInProgressInspectionFormURL,
      success: (dio.Response<dynamic> response) {
        isInspectionLoading.value = false;
        InspectionListResponseModel inspectionFormsResponseModel = InspectionListResponseModel.fromJson(jsonDecode(response.data));
        inProgressInspectionList.value = inspectionFormsResponseModel.data ?? [];
        fetchCompletedInspectionList();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void fetchFormDetail({String? formId}) {
    apiServiceCall(
      params: {
        "manage_user_id": getLoginData()!.data?.erpId,
        "form_id": formId
      },
      serviceUrl: ApiConfig.fromDetailURL,
      success: (dio.Response<dynamic> response) {
        FormDetailResponseModel formDetailResponseModel = FormDetailResponseModel.fromJson(jsonDecode(response.data));
        selectedFormDetail.value = formDetailResponseModel.data ?? [];
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}