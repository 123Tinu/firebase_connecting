import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProDetPage extends StatefulWidget {
  const ProDetPage({super.key});

  @override
  State<ProDetPage> createState() => _ProDetPageState();
}

class _ProDetPageState extends State<ProDetPage> {
  List<String> sizes = ['6', '7', '8', '9', '10', "11"];
  int selectedSizeIndex = -1;
  final cartKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSizeIndex = index;
                        print(sizes[selectedSizeIndex]);
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Center(
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: selectedSizeIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    sizes[index],
                                    style: TextStyle(
                                      color: selectedSizeIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 216,
            height: 55,
            color: Colors.white,
            key: cartKey,
            child: TextButton(
                onPressed: () {
                  Get.snackbar(
                    "Added To Cart", // Title
                    "Product successfully added to cart", // Message
                    duration: Duration(seconds: 1),
                  );

                },
                child: const Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                )),
          ),
          Container(
            width: 216,
            height: 55,
            color: Colors.black,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Buy now",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                )),
          ),
        ]),
      ),
    );
  }
}
