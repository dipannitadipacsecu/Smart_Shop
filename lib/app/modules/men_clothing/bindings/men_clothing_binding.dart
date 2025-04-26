import 'package:get/get.dart';

import '../controllers/men_clothing_controller.dart';

class MenClothingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenClothingController>(
      () => MenClothingController(),
    );
  }
}
