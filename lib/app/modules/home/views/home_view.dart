import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/custom_drawer_implementation.dart';
import '../controllers/home_controller.dart';
import 'widgets/home_content.dart'; // Import your widget

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shop'),
        backgroundColor: const Color.fromARGB(255, 110, 117, 172),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeContent(),
          _buildOrderPage(),
          _buildNotificationPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      ),
    );
  }

  Widget _buildOrderPage() {
    return const Center(child: Text('Order Page'));
  }

  Widget _buildNotificationPage() {
    return const Center(child: Text('No notifications'));
  }
}
