import 'package:get/get.dart';

import '../controllers/selectpage_controller.dart';

class SelectpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectpageController>(
      () => SelectpageController(),
    );
  }
}
