import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/product_model.dart';

class AllProductsController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  final allProductsUrl = "https://fakestoreapi.com/products";

  @override
  void onInit() {
    fetchProducts();

    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;

      var response = await http.get(Uri.parse(allProductsUrl));

      if (response.statusCode == 200) {

        /// See the json of the Url. You can see, it is List of Object. Means List of Map for Dart
        /// So that, we need a Map List dataType.
        List<dynamic> products = json.decode(response.body);
       print("All products Response : ${response.body}");

        
        
        /// Convert the each Map from the List of Maps to the List of ProductModel object.
        for (var i = 0; i < products.length; i++) {
          ProductModel productModelObject = ProductModel.fromJson(products[i]); // product model object
          productList.add(productModelObject); // add the object to the ProductModel List for each itteration
        }
      } else {
        /// Show a toast message
        Get.snackbar("Error", "Failed to fetch products");
      }
    } catch (e) {
      /// Show a toast message
      Get.snackbar("Error", e.toString());
    } finally {
      /// after run the success or error process, then Circular loading of UI should be Hide.
      isLoading.value = false;
    }
  }
}