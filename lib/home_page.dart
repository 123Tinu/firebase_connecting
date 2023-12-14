import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    shoeList();
    super.initState();
  }
  String title = "Settings";


  final url = "https://fir-connecting-b9936-default-rtdb.firebaseio.com/"+"shoeList.json";
  var shoeImages = [];
  var shoeName1 = [];
  var shoeName2 = [];
  var shoePrice = [];



  shoeList() async {
    final result = await http.get(Uri.parse(url));
    final List<dynamic> decodedData = json.decode(result.body);

    // if (decodedData is List) {

    decodedData.forEach((item) {
      shoeName1.add(item["name"]);
      shoeName2.add(item["subName"]);
      shoePrice.add(item["price"].toString());
      shoeImages.add(item["image"]);
    });
    setState(() {
    });
  }

  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final List<String> imgList = [

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon: Icon(Icons.search, size: 25, color: Colors.black),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Column(children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "Trending Deals",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CarouselSlider(
                items: imgList.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 500),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == entry.key ? Colors.red : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "All category",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 radius: 40,
          //                 backgroundImage:
          //                     AssetImage("assets/images1/nike.jpeg")),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text("Nike")
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 radius: 40,
          //                 backgroundImage:
          //                     AssetImage("assets/images1/adidas.jpeg")),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text("Adidas"),
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 radius: 40,
          //                 backgroundImage:
          //                     AssetImage("assets/images1/puma.jpeg")),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text("Puma")
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               child: CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 radius: 40,
          //                 backgroundImage:
          //                     AssetImage("assets/images1/newbalance.jpeg"),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text("New Balance")
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 radius: 40,
          //                 backgroundImage:
          //                     AssetImage("assets/images1/converse.jpeg")),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text("Converse")
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "Top Selection",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 5.0,
                  // mainAxisSpacing: 5.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: shoeName1.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) {
                    //       return ProductDetailsPage();
                    //     },
                    //   ));
                    // },
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: SizedBox(
                        child: Column(
                          children: [
                            Image(image: NetworkImage(shoeImages[index]),width: 200, height: 125,),
                            Text(shoeName1[index] ??"tfggfggggy"),
                            Text(shoeName2[index]??"hhhhhfgg"),
                            Text(shoePrice[index].toString()??" gfg hhggvvg"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
