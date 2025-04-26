import 'package:get/get.dart';

import '../controllers/women_clothing_controller.dart';

class WomenClothingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WomenClothingController>(
      () => WomenClothingController(),
    );
  }
}
