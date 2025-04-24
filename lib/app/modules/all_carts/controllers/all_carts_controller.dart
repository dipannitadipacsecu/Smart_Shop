import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/cart_model.dart';

class AllCartsController extends GetxController {
  //TODO: Implement AllCartsController
  var isLoading = true.obs;
  var cartList = <CartModel>[].obs;
  final allCartssUrl = "https://fakestoreapi.com/carts?userId=1";
  
  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  void fetchCarts() async {
    try {
      isLoading.value = true;

      var response = await http.get(Uri.parse(allCartssUrl));

      if (response.statusCode == 200) {

        /// See the json of the Url. You can see, it is List of Object. Means List of Map for Dart
        /// So that, we need a Map List dataType.
        List<dynamic> carts = json.decode(response.body);
        print("All Carts Response : ${response.body}");
        
        /// Convert the each Map from the List of Maps to the List of ProductModel object.
        for (var i = 0; i < carts.length; i++) {
          CartModel cartModelObject = CartModel.fromJson(carts[i]); // product model object
          cartList.add(cartModelObject); // add the object to the ProductModel List for each itteration
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
      // print(carts.length());
    }
  }
}
