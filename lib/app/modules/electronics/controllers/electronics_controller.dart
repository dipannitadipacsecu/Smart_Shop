import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/ElectronicsModel.dart';

class ElectronicsController extends GetxController {
  var isLoading = true.obs;
  var electronicsList = <ElectronicsModel>[].obs;

  final String apiUrl = "https://fakestoreapi.com/products/category/electronics";

  @override
  void onInit() {
    fetchElectronicsProducts();
    super.onInit();
  }

  void fetchElectronicsProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(apiUrl));
      print('API Response: ${response.body}'); 

      if (response.statusCode == 200) {
        List<dynamic> items = json.decode(response.body);
        electronicsList.value = items.map((e) => ElectronicsModel.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Failed to load electronics products");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
