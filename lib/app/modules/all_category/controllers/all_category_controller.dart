import 'package:get/get.dart';

class AllCategoryController extends GetxController {
  //TODO: Implement AllCategoryController

  final RxList<Map<String, String>> categories = <Map<String, String>>[
  {
    "name": "Electronics",
    "image": "https://www.seekpng.com/png/full/774-7744281_samsung-electronics-samsung-electronic-product-png.png",
  },
  {
    "name": "Jewellery",
    "image": "https://th.bing.com/th/id/OIP._f-fVhcoQCCcuEUz34yMiwHaEL?rs=1&pid=ImgDetMain",
  },
  {
    "name": "Men's Clothing",
    "image": "https://th.bing.com/th/id/OIP.p_rebG9uNrRnhxk9XF-BNQHaLx?w=1063&h=1690&rs=1&pid=ImgDetMain",
  },
  {
    "name": "Women's Clothing",
    "image": "https://th.bing.com/th/id/OIP.hF7QTj2zZqAf4Mu0SpB6MgHaE_?rs=1&pid=ImgDetMain",
  },
].obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
