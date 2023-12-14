import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class CounterAppGetX extends StatefulWidget {
  const CounterAppGetX({super.key});

  @override
  State<CounterAppGetX> createState() => _CounterAppGetXState();
}

class _CounterAppGetXState extends State<CounterAppGetX> {
  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("set-state");
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
            Obx(() => Text("Counter 1 : ${_counterController.count}")),
            Obx(() =>  Text("Counter 2 : ${_counterController.count}")),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _counterController.incCount();
                    },
                    child: const Text("Increment")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _counterController.decCount();
                    },
                    child: const Text("Deccrement")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
