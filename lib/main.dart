import 'package:firebase_connecting/home_page.dart';
import 'package:firebase_connecting/home_page_2.dart';
import 'package:firebase_connecting/reafProdct.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home2());
  }
}
