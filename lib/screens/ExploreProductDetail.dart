// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';
import 'package:grocery_app/Model/model.dart';
import 'package:grocery_app/screens/AboutProduct.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';

class ExploreProductDetail extends StatelessWidget {
  const ExploreProductDetail({ Key? key,this.items,this.name }) : super(key: key);
  final String? name;
  final List<GroceryItem>? items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: backArrow(context: context, routename: HomePage(pageIndex: 1,)),
          title: Center(
              child: text(
                  name: name!,
                  color: Colors.black,
                  fontweight: FontWeight.bold)),
          actions: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppImages.filterImage,width: 20),
          )],
        ),
        body: GridView.builder(
            itemCount: items!.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8.0,
                  crossAxisCount: 2,crossAxisSpacing: 8.0,mainAxisSpacing: 8.0,mainAxisExtent: 300.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context)=>AboutProduct(
                      groceryItem: items![index],
                      length:items!.length,
                            index: index,
                            check: items!,
                      
                      )));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 250,
                  child: Card(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: SizedBox(
                            height: 70,
                            child: Image.asset(items![index].image!)),
                      ),
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: text(
                              name: items![index].name,
                              fontSize: 18,
                              fontweight: FontWeight.bold)),
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: text(
                              name: items![index].description, fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10,bottom: 40),
                        child: Row(
                          children: [
                            text(
                                name: items![index].price.toString(),
                                fontSize: 20,
                                fontweight: FontWeight.bold),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              );
            }));
  }
}
