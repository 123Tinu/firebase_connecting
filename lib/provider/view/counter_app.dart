import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../change_notifier/change_notifier.dart';


class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final count = counter.count;

    return Scaffold(
      appBar: AppBar(title: Text("Provider [state management]"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("You pressed button $count times",style: const TextStyle(fontSize: 30),))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        counter.increment();
      },child: Icon(Icons.add)),
    );
  }
}