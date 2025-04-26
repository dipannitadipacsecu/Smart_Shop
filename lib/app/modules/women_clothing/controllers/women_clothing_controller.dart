import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/WomenClothModel.dart';

class WomenClothingController extends GetxController {
  var isLoading = true.obs;
  var womenClothList = <WomenClothModel>[].obs;

  final String apiUrl = "https://fakestoreapi.com/products/category/women's clothing";

  @override
  void onInit() {
    fetchWomenClothProducts();
    super.onInit();
  }

  void fetchWomenClothProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> items = json.decode(response.body);
        womenClothList.value = items.map((e) => WomenClothModel.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Failed to load women's clothing");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
