import 'package:get/get.dart';

import '../controllers/product_details_view_dart_controller.dart';

class ProductDetailsViewDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsViewDartController>(
      () => ProductDetailsViewDartController(),
    );
  }
}
