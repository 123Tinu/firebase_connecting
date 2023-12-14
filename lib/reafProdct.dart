import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadShoes extends StatefulWidget {
  const ReadShoes({super.key});

  @override
  State<ReadShoes> createState() => _ReadShoesState();
}

class _ReadShoesState extends State<ReadShoes> {
  var isLoading = true;
  
  var name=[];
  var price=[];
  var image=[];

  @override
  void initState() {
    // TODO: implement initState
    readShoes();
    super.initState();
  }

  readShoes() async {
    var url="https://fir-connecting-b9936-default-rtdb.firebaseio.com/"+"shoes.json";
    
    final result=await http.get(
      Uri.parse(url)
    );
    
    final data= json.decode(result.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      name.add(value["shoeName"]);
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
      body: isLoading
          ? const CircularProgressIndicator()
          : GridView.builder(
        itemCount: name.length,
              itemBuilder: (context, index) {
                return Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Image(image: NetworkImage(image[index]),width: 200, height: 125,),
                        Text("${name[index]}"),
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
