import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  final List<String> items = List.generate(3, (_) => 'Green Nike Air Shoes');
  // const pay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Order Review',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
     body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.grey.shade200,
                        child: Image(image: AssetImage('assets/images/panda.png'),
                        fit: BoxFit.contain,)
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                              children: [
                                Text("Shoes & Snickers"),
                                SizedBox(width: 5),
                                Icon(Icons.verified, color: Colors.blue, size: 16),
                              ],
                            ),
                        Text(
                          'Green Nike Air Shoes',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ORDER SUMMARY
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow('Subtotal', '\$14373.0'),
                  _buildRow('Shipping Fee', '\$8.0'),
                  _buildRow('Tax Fee', '\$141.0'),
                  const Divider(),
                  _buildRow('Order Total', '\$1615.0', bold: true),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Paymennt Method',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Change',
                          style: TextStyle(color: Colors.blueAccent)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.account_balance_wallet_rounded,
                          color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Paypal', style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {},
          child: const Text('Checkout  \$4000.0',
              style: TextStyle(fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
