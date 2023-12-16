
import 'package:firebase_connecting/provider/change_notifier/change_notifier.dart';
import 'package:firebase_connecting/provider/view/counter_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context) => CounterProvider(),
        child: const MaterialApp(home: CounterPage()));
  }
}