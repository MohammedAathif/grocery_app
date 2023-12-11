// ignore_for_file: avoid_print, file_names, prefer_typing_uninitialized_variables, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';
import 'package:grocery_app/screens/Database/database.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../Model/model.dart';
import '../widgets/widgets.dart';

class AboutProduct extends StatefulWidget {
  AboutProduct(
      {Key? key, this.length, this.index, this.groceryItem, this.check})
      : super(key: key);

  final GroceryItem? groceryItem;
  var length;
  var index;
  List<GroceryItem>? check;

  @override
  State<AboutProduct> createState() => _AboutProductState(groceryItem);
}

class _AboutProductState extends State<AboutProduct> {
  //bool favourite = false;
  var originalPrice = 0.0;
  var finalPrice = 0.0;
  final GroceryItem? groceryItem;
  //List<bool> booladdToCart = [];
  List<GroceryItem> addToCart =[];
  List<GroceryItem> addToFavourite = [];
  //late SharedPreferences prefs;
  _AboutProductState(this.groceryItem);

  // void getFavourite() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     favourite = prefs.getBool('favourite') ?? false;
  //   });
  // }

  @override
  void initState() {
   // getFavourite();
    super.initState();
    print("original price starting" + groceryItem!.price.toString());
    originalPrice = groceryItem!.price!;
    //SharedPreferencesHelper.addToCartData();
    print("original price starting $originalPrice");
    //boolCheck();
  }

  // boolCheck() {
  //   for (int i = 0; i < widget.length; i++) {
  //     booladdToCart.add(false);
  //     print("final boolean value is ${booladdToCart}");
  //     print(widget.index);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height / 2;
    print("$height is the height of screen");
    return Scaffold(
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: height * 0.90,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.black,
                              onPressed: () {
                                //Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(pageIndex: 0)));
                              }),
                          const Icon(
                            Icons.file_upload,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: height * 0.1),
                    Image.asset(widget.groceryItem!.image!,height: height * 0.60,width: width * 0.7,),
                  ],
                )),
            // SizedBox(height: height * 0.1),
            SizedBox(
              height: height * 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ListTile(
                    title: text(
                        name: widget.groceryItem!.name,
                        fontSize: 20,
                        fontweight: FontWeight.bold),
                    subtitle: text(name: widget.groceryItem!.description),
                    trailing: IconButton(
                        icon: widget.groceryItem!.isfavorite == false
                            ? const Icon(Icons.favorite_border)
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          setState(() {
                            if (addToFavourite.contains(widget.groceryItem!)) {
                              print("Already added");
                             // widget.groceryItem!.isfavorite = widget.groceryItem!.isfavorite == false ? true : false;
                              //SharedPreferencesHelper.remove('addToFavorite');
                              print("removed");
                            } else {
                               widget.groceryItem!.isfavorite = widget.groceryItem!.isfavorite == false ? true : false;
                               if(widget.groceryItem!.isfavorite == true) {
                                  addToFavourite.add(widget.groceryItem!);
                              
                              SharedPreferencesHelper.addTofavoriteData(
                                  addToFavourite);
                               } else {
                                 SharedPreferencesHelper.remove('addToFavorite');
                               }
                              
                                 
                              //favourite = !favourite;
                            }

                            // print(widget.groceryItem!.isfavorite);
                            // favourite = !favourite;
                            // print(widget.groceryItem!.isfavorite);
                            // print("favourite is $favourite");

                            // addToFavourite.add(widget.groceryItem!);
                            // prefs.setBool('favourite', widget.groceryItem!.isfavorite!);
                            // Favourite(addToFavorite: addToFavourite);
                            //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Favourite(addToFavorite: addToFavourite,)));
                          });
                        })),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () => setState(() {
                                widget.groceryItem!.number =  widget.groceryItem!.number! - 1;
                                 widget.groceryItem!.price = widget.groceryItem!.price! - originalPrice;
                              }),
                          child: const Icon(Icons.remove)),
                      const SizedBox(width: 5),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 2,
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: Colors.white),
                            child: Center(child: Text( widget.groceryItem!.number.toString()))),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () => setState(() {
                           widget.groceryItem!.number =  widget.groceryItem!.number! + 1;
                          print("number is ${widget.groceryItem!.number}");
                           widget.groceryItem!.price = widget.groceryItem!.price! + originalPrice;
                          //SharedPreferencesHelper.setPrice(originalPrice);
                          print("originalPrice is $originalPrice");
                        }),
                        child: const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      text(
                          name: '\$${widget.groceryItem!.price!}'.toString(),
                          fontweight: FontWeight.bold,
                          fontSize: 20)
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      text(name: 'Product Detail', fontweight: FontWeight.bold),
                      const Spacer(),
                      ExpandIcon(onPressed: ((value) => value))
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      text(name: 'Nutritions', fontweight: FontWeight.bold),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      text(name: 'Review', fontweight: FontWeight.bold),
                      const Spacer(),
                      for(int i=0; i>5; i++)
                        const Icon(Icons.star, color: Colors.red),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SizedBox(height: height * 0.010),
                GestureDetector(
                    onTap: () {
                      setState(() {
                       // print("pressed");
                      //setState(() {
                        // booladdToCart[widget.index] = true;
                        // print(booladdToCart);
                        widget.groceryItem!.isaddToCart = true;
                        addToCart.add(widget.groceryItem!);
                        // print('Added value is ${addToCart[0].description}');
                        // print('final result is ${widget.groceryItem!.isaddToCart}');
                        SharedPreferencesHelper.addToCartData(addToCart);
                        // SharedPreferences.getInstance().then((data) {
                        //   data.getKeys().forEach((key) {
                        //     print(key + "=" + data.get(key).toString());
                        //   });
                        // });
                            Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context)
                          =>
                          HomePage(pageIndex: 2)
                         //Carts()
                          ));
                      });
                      
                      //});
                    },
                    child: 
                    // button(
                    //   name: "Add To Basket",
                    //   height: height * 0.14,
                    //   width: width * 1.85,
                    //   color: Colors.white,
                    //   btncolor: Colors.green,
                    //   context: context
                    // )

                    Container(
                      height: height * 0.14,
                      width: width * 1.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.green),
                      child: const Center(
                          child: Text(
                        "Add To Basket",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    )
              ]),
            ),
          ]),
    );
  }
}
