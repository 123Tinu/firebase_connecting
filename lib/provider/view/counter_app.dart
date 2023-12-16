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
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Count : $count",
            style: const TextStyle(fontSize: 30),
          )),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              onPressed: () {
                counter.increment();
              },
              child: const Icon(Icons.add)),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              onPressed: () {
                counter.decrement();
              },
              child: const Icon(Icons.minimize))
        ],
      ),
    );
  }
}
