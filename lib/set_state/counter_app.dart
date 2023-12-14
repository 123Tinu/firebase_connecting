import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count=0;
  void incCount(){
    setState(() {
      count=count+1;
    });
  }
  void decCount(){
    setState(() {
      count=count-1;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("setstate");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set state"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter : $count"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  incCount();
                }, child: const Text("Increment")),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: () {
                  decCount();
                }, child: const Text("Deccrement")),
              ],
            )
          ],
        ),
      ),
    );
  }
}