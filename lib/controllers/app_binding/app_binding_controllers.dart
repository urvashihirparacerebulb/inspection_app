import 'package:get/get.dart';
import 'package:inspection_app/controllers/authentication_controller.dart';
import '../general_controller.dart';
import '../inspection_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    Get.put<InspectionController>(InspectionController(), permanent: true);
  }
}
