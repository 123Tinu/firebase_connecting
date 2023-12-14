import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var isLoading = true;

  final url="https://fir-connecting-b9936-default-rtdb.firebaseio.com/"+"shoeList.json";


  var nameA=[];
  var nameS=[];
  var price=[];
  var image=[];

  @override
  void initState() {
    readShoeList();
    super.initState();
  }

  readShoeList() async {

    final result=await http.get(Uri.parse(url));
    //
    // final data=json.decode(result.body)as Map<String,dynamic>;
    // data.forEach((key, value) {
    //
    // });
    final data = json.decode(result.body)as Map<String, dynamic>;
    data.forEach((key, value) {
      nameA.add(value["name"]);
      nameS.add(value["subName"]);
      price.add(value["price"]);
      image.add(value["image"]);
    });

    setState(() {
      isLoading=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Image(image: NetworkImage(image[index]),width: 200, height: 125,),
                    Text("${nameA[index]}"),
                    Text("${nameS[index]}"),
                    Text("Price ${price[index].toString()}"),
                  ],
                ),
              ),
            );
          },
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          )),
    );
  }
}
