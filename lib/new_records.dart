import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NewRecords extends StatefulWidget {
  const NewRecords({super.key});

  @override
  State<NewRecords> createState() => _NewRecordsState();
}

class _NewRecordsState extends State<NewRecords> {
  var names = [];
  var age = [];
  var table = "https://fir-connecting-b9936-default-rtdb.firebaseio.com/" +
      "ProductRecords.json";

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.yellowAccent,
            child: const Column(
              children: [Text(''), Text('')],
            ),
          );
        },
      ),
    );
  }
}
