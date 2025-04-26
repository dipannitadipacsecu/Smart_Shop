import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/JwelleryModel.dart';


class JwelleryController extends GetxController {
  var isLoading = true.obs;
  var jwelleryList = <JwelleryModel>[].obs;

  final String apiUrl = "https://fakestoreapi.com/products/category/jewelery";

  @override
  void onInit() {
    fetchJwelleryProducts();
    super.onInit();
  }

  void fetchJwelleryProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(apiUrl));
       print('API Response: ${response.body}'); 

      if (response.statusCode == 200) {
        List<dynamic> items = json.decode(response.body);
        jwelleryList.value = items.map((e) => JwelleryModel.fromJson(e)).toList();
        print('Jwellery List Length: ${jwelleryList.length}');

      } else {
        Get.snackbar("Error", "Failed to load jewellery products");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
