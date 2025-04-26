import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            
            accountName: Text(
              user?.displayName ?? 'Guest',
              style: const TextStyle(fontSize: 18),
            
            ),
            accountEmail: Text(
              user?.email ?? '',
              style: const TextStyle(fontSize: 14),
            ),
            currentAccountPicture: CircleAvatar(
    backgroundColor: Colors.white,
    child: ClipOval(
      child: user?.photoURL != null && user!.photoURL!.isNotEmpty
          ? Image.network(
              user.photoURL!,
              fit: BoxFit.cover,
              width: 80,
              height: 80,
              errorBuilder: (context, error, stackTrace) {
                // fallback if network image fails
                return Image.asset(
                  "assets/images/profile.jpg",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                );
              },
            )
          : Image.asset(
              "assets/images/profile.jpg",
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
    ),
  ),
            decoration: const BoxDecoration(color: Colors.blueAccent),
          ),

          ListTile(
            leading: const Icon(Icons.shop, color: Colors.blue),
            title: const Text('Shop Items'),
            onTap: () {
              print('Shop Items tapped!');
            },
          ),

          ListTile(
            leading: const Icon(Icons.payment, color: Colors.blue),
            title: const Text('Pay'),
            onTap: () {
              print('Pay tapped!');
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.blue),
            title: const Text('Cart'),
            onTap: () {
              Get.toNamed(Routes.ALL_CARTS);
            },
          ),

          const Divider(),

          const Spacer(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut(); // ✅ Firebase Logout
              Get.offAllNamed('/login'); // ✅ Go back to Login screen
            },
          ),
        ],
      ),
    );
  }
}
