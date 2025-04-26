import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/routes/app_pages.dart';
import '../controllers/all_category_controller.dart'; // Assuming you have it

class AllCategoryView extends GetView<AllCategoryController> {
  const AllCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];

            return GestureDetector(
              onTap: () {
                if (category['name'] == 'Jewellery') {
                  Get.toNamed(Routes.JWELLERY);
                }
                if (category['name'] == 'Electronics') {
                  Get.toNamed(Routes.ELECTRONICS);
                }
                if (category['name'] == "Men's Clothing") {
                  Get.toNamed(Routes.MEN_CLOTHING);
                }
                if (category['name'] == "Women's Clothing") {
                  Get.toNamed(Routes.WOMEN_CLOTHING);
                }
                // Later you can add more category checks here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          category['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
