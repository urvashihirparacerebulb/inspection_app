class ApiConfig {

  static const String baseURL = "https://inspection.cerebulb.com/api/";
  static const String loginURL = "${baseURL}login";
  static const String fetchInspectionFormURL = "${baseURL}fetch-form";
  static const String fetchInProgressInspectionFormURL = "${baseURL}fetch-in-progress-answer";
  static const String fetchCompletedInspectionFormURL = "${baseURL}fetch-completed-answer";
  static const String fromDetailURL = "${baseURL}show-form-details";

  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Error";
  static const String success = "Success";
  static const String warning = "Warning";

  static const String loginPref = "loginPref";
}
