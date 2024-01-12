// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/ExploreProductDetail.dart';
import 'package:grocery_app/utils/app_constants.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List colors = [
    Colors.lightBlue.shade200,
    Colors.orangeAccent.shade100,
    Colors.lightGreen.shade100,
    Colors.lightBlue.shade100,
    Colors.orange.shade100,
    Colors.lightBlue.shade200
  ];

  List names = [
    'Fresh Fruits & vegetable',
    'Beverages',
    'Dairy & Eggs',
    'Cooking Oil & Ghee',
    'Meat & Fish',
    'Bakery & Snacks'
    
    
  ];

  List images = [
    AppImages.fruitsImage,
    AppImages.juiceImage,
    AppImages.dairyImage,
    AppImages.oilImage,
    AppImages.meatImage,
    AppImages.snacksImage,
  ];

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height/2;
    // var width = MediaQuery.of(context).size.width/2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: text(
                name: "Find Products",
                color: Colors.black,
                fontSize: 20,
                fontweight: FontWeight.bold)),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.grey.shade200,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Search Store"),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 200,
                crossAxisSpacing: 16.0),
            itemCount: names.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ExploreProductDetail(
                                name: names[index],
                                items: index==0 ? fruits : index == 1 ? coolDrinks : index == 2 ? dairyEggs : vegetables,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors[index],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 80, child: Image.asset(images[index])),
                        text(name: names[index])
                      ]),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
