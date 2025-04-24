import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_view_dart_controller.dart';

class ProductDetailsViewDartView
    extends GetView<ProductDetailsViewDartController> {
  const ProductDetailsViewDartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsViewDartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailsViewDartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
