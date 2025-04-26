import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/MenClothModel.dart';

class MenClothingController extends GetxController {
  var isLoading = true.obs;
  var menClothList = <MenClothModel>[].obs;

  final String apiUrl = "https://fakestoreapi.com/products/category/men's clothing";

  @override
  void onInit() {
    fetchMenClothProducts();
    super.onInit();
  }

  void fetchMenClothProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> items = json.decode(response.body);
        menClothList.value = items.map((e) => MenClothModel.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Failed to load men's clothing");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
