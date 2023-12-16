
import 'package:firebase_connecting/project/cart_page.dart';
import 'package:firebase_connecting/project/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'form/view/login_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        home:LoginHome()
    );
  }
}
