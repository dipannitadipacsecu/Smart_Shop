import 'package:flutter/material.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/custom_drawer_implementation.dart';

class CustomDrawerExample extends StatelessWidget{
  const CustomDrawerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Drawer'),),
      drawer: CustomDrawer(),
);
}
}