import 'package:get/get.dart';
import '../general_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(),
        permanent: true);
  }
}
