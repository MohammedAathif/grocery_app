// ignore_for_file: file_names, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:grocery_app/utils/shared_preference.dart';
import 'package:grocery_app/utils/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/model.dart';
import 'AboutProduct.dart';


class DetailPage extends StatefulWidget {
  List<GroceryItem>? groceryItems;
  DetailPage({Key? key, this.groceryItems}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<bool> colorchange = [];
  List<GroceryItem> addToCart = [];
  late SharedPreferences pref;
  @override
  void initState(){
    super.initState();
    check();
    //checkBool();
  }

  check() async {
    pref = await SharedPreferences.getInstance();
    for(int i=0;i<widget.groceryItems!.length;i++){
      
      colorchange.add(pref.getBool('get bool') ?? false);
    }
  }


  // checkBool() async {
  //  pref = await SharedPreferences.getInstance();
  //  for(int i=0;i<widget.groceryItems!.length;i++){
  //     colorchange.add(false);
  //   }
  //  colorchange =  (pref.getBool('get bool') ??  false) as List<bool>;
  // }
  
  

  @override
  Widget build(BuildContext context) {
    //debugPrint("beverageList :==>" + groceryItems![0].description);

    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AboutProduct(
                            groceryItem: widget.groceryItems![index],
                            length: widget.groceryItems!.length,
                            index: index,
                            check: widget.groceryItems!,
                            //length:widget.groceryItems!.length,
                          )));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 250,
              child: Card(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                        height: 70,
                        child: Image.asset(widget.groceryItems![index].image!)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      child: text(
                          name: widget.groceryItems![index].name,
                          fontSize: 18,
                          fontweight: FontWeight.bold)),
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      child: text(
                          name: widget.groceryItems![index].description,
                          fontSize: 15)),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Row(
                      children: [
                        text(
                            name: '\$${widget.groceryItems![index].price}',
                            fontSize: 20,
                            fontweight: FontWeight.bold),
                        const Spacer(),
                        InkWell(
                          onTap: () => setState(() {
                            colorchange[index] = true;
                            widget.groceryItems![index].isaddToCart = true;
                            addToCart.add(widget.groceryItems![index]);
                            SharedPreferencesHelper.addToCartData(addToCart);
                            pref.setBool('get bool', colorchange[index]);
                            }),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: check == true ? Colors.green : Colors.red,
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
        },
        itemCount: widget.groceryItems!.length,
      ),
    );
  }
}
