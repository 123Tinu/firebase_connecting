import 'package:flutter/material.dart';
class Cart_Page extends StatefulWidget {
  const Cart_Page({super.key});

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart",
        style: TextStyle(
          color: Colors.black
        ),
        ),
      ),
      body: Center(
        child: Text("Selected Size : ",
        ),
      ),
    );
  }
}
