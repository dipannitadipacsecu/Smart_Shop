import 'package:get/get.dart';

import '../controllers/jwellery_controller.dart';

class JwelleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JwelleryController>(
      () => JwelleryController(),
    );
  }
}
