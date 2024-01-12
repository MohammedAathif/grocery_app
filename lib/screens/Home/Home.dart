// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Details.dart';
import 'package:grocery_app/utils/app_constants.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Image> carousel = [
    Image.asset(AppImages.vegetableImage1),
    Image.asset(AppImages.vegetableImage2),
    Image.asset(AppImages.vegetableImage3),
  ];

  int currentIndexPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(children: [
        SizedBox(height: 40, child: Image.asset(AppImages.carrotRedImage)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
            text(name: "Dhaka, Banssre", fontSize: 20)
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.grey.shade200,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: "Search Store"),
          ),
        ),
        CarouselSlider(
          items: carousel,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndexPage = index;
              });
            },
            initialPage: 0,
            pageSnapping: false,
            enableInfiniteScroll: false,
            autoPlay: false,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carousel.asMap().entries.map((entry) {
            // ignore: avoid_print
            print("currentIndexPage is $currentIndexPage");
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
               // child: Text(entry.value.toString()),
                width: currentIndexPage == entry.key ? 35.0 : 6.0,
                height: currentIndexPage == entry.key ? 8.0 : 6.0,
                margin: EdgeInsets.symmetric(
                    vertical: currentIndexPage == entry.key ? 12.0 : 8.0,
                    horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // shape:  currentIndexPage == entry.key ? BoxShape.rectangle : BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.blue.shade900)
                        .withOpacity(
                            currentIndexPage == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        header(name1: "Exclusive offer", name2: "See all", color: Colors.green),
        DetailPage(groceryItems: fruits),

        header(name1: "Best Selling", name2: "See all", color: Colors.green),
        DetailPage(groceryItems: vegetables),

        header(name1: "Beverages", name2: "See all", color: Colors.green),
        // DetailPage(Item: fruits,groceryItems: fruits,)
        DetailPage(
          groceryItems: coolDrinks,
        )
      ]),
    ));
  }
}
