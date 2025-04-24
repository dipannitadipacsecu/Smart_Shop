import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/all_products/controllers/all_products_controller.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/custom_drawer_implementation.dart';
import 'package:smart_shop/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    final productController = Get.put(AllProductsController());

    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          const Text('Dipannita'),
          const SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                "assets/images/profile.jpg",
                fit: BoxFit.contain,
                width: 50,
                height: 50,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          // Category header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton( 
                  onPressed: () {
                   Get.toNamed(Routes.ALL_PRODUCTS);
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
          ),

          // Horizontal ListView
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Image.asset('assets/images/green_shoe.jpg'),
                  ),
                );
              },
            ),
          ),

          // Popular Products
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                     Get.toNamed(Routes.ALL_PRODUCTS);
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
          ),

          // GridView of products
          Expanded(
  child: Obx(() {
    if (productController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
           childAspectRatio: 0.75,
        ),
        itemCount: productController.productList.length,
        itemBuilder: (context, index) {
          final product = productController.productList[index];

         return Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  elevation: 2,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Product Image
      ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          product.image,
          height: 100,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        ),
      ),

      // Body Padding
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),

            // Rating
            Row(
              children: [
                Text(
                  product.rating?.rate.toStringAsFixed(1) ?? '0.0',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, size: 14, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 6),

            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);

        },
      ),
    );
  }),
),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation actions here
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      ),
    );
  }
}
