// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/card/views/card_view.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("University of Chittagong"), accountEmail: Text('university@chittagong'),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: Image.asset("assets/images/green_shoe.jpg",
                fit: BoxFit.contain,
                width: 50,
                height: 50,),
                
              ),
            ),
            decoration: BoxDecoration(color: Colors.amber),
            
            
            ),
            

            ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Shop Items'),
        subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          print('ListTile tapped!');
        },
      ),


      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Pay'),
        subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          print('ListTile tapped!');
        },
      ),

      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('cart'),
        // subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          // print('ListTile tapped!');
          // Get.to(CardView()); 
          Get.toNamed(Routes.ALL_CARTS);
        },
      ),

      Divider(),
      Spacer(),

      ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text('logout'),
        onTap: () {
          Navigator.pop(context);
        },
      ),



            
        ],
     ),
);
}
}
