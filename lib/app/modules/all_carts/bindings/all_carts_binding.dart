import 'package:get/get.dart';

import '../controllers/all_carts_controller.dart';

class AllCartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCartsController>(
      () => AllCartsController(),
    );
  }
}
