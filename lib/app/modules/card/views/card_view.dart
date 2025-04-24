import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
   final List<int> cartItems = List.generate(6, (index) => 5);
  // const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product Image
                      ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Container(
    height: 60,
    width: 60,
    color: Colors.grey.shade200, 
    child: Image(
      image: AssetImage('assets/images/green_shoe.jpg'),
      fit: BoxFit.contain,
    ),
  ),
),

                      SizedBox(width: 12),
                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Shoes & Snickers"),
                                SizedBox(width: 5),
                                Icon(Icons.verified, color: Colors.blue, size: 16),
                              ],
                            ),
                            Text(
                              "Green Nike Air Shoes",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                // Minus button
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey.shade300,
                                  child: Icon(Icons.remove, size: 14),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${cartItems[index]}",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(width: 10),
                                // Plus button
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add, size: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      // Price
                      Text(
                        "\$\$4000.0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Checkout Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Checkout  \$4000.0",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
