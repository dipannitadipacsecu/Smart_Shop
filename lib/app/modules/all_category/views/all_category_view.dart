import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_category_controller.dart';

class AllCategoryView extends GetView<AllCategoryController> {
  const AllCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllCategoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
