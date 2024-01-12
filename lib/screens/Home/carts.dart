// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/orderAccept.dart';
import 'package:grocery_app/utils/app_constants.dart';
import 'package:grocery_app/utils/shared_preference.dart';
import 'package:grocery_app/utils/widgets.dart';
import '../../Model/model.dart';

class Carts extends StatefulWidget {
  const Carts({
    Key? key,
  }) : super(key: key);

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  var subTotal = 0.0;
  var cardProductPrice = 0.0;
  var local = 0.0;
  bool show = false;
  List<GroceryItem>? allProductsList = [
    ...fruits,
    ...coolDrinks,
    ...vegetables,
    ...dairyEggs
  ];

  List<GroceryItem>? finalCartDisplay;

  List first = [1, 2, 3];
  List second = [4, 5];
  List third = [6, 7, 8];
  int count = 0;

  @override
  void initState() {
    super.initState();
    //addList();
    finalCart();
    finalCartDisplay = [];
    
    local = cardProductPrice ;
    value();
  }

  void value() {
    print('Getting data from finalcart');
    
    for(int i = 0;i<allProductsList!.length;i++){
      if(allProductsList![i].isaddToCart == true){
        print("In For Loop");
        print("Getting one value in ${allProductsList![i].isaddToCart}");
        //print(finalCartDisplay![i].isaddToCart);
        print("Printed Now");}
      i +=1;
    }
    print("Ended");
  }

  void addList() {
    print("Entered into addlist");
    setState(() {
      List combine = first + third;
      print("Combined value is $combine");
      List combine1 = [...first, ...second, ...third];
      print("Combined value is $combine1");
      List combine2 =
          [first, second, third].expand((element) => element).toList();
      print("Combined value is $combine2");
      List combine3 = List.from(first)
        ..addAll(second)
        ..addAll(third);
      print("Combined value is $combine3");
    });
  }

  void finalCart() async {
    //addToCart!.from(fruits);
    //addToCart = await cartItems(false);
    for (int i = 0; i < allProductsList!.length; i++) {
      // addToCart![i].add;
      
      if(allProductsList![i].isaddToCart == true){
        print('final Cart is ${allProductsList![i].name}');
      print('final Cart is ${allProductsList![i].isaddToCart}');}
    }
  }

  // @override
  // void initState() {
  //   print("Welcome to Cart Page");
  //   super.initState();

  //   // SharedPreferences.getInstance().then((data) {
  //   //   data.getKeys().forEach((key) {
  //   //     print(key + "==" + data.get(key).toString());
  //   //   });
  //   // });
  // }

  Future<List<GroceryItem>?> cartItems(bool check) async {
    if (check == true) {
      finalCartDisplay = await SharedPreferencesHelper.getAddToCartData();
      //   SharedPreferences.getInstance().then((data) {
      //   data.getKeys().forEach((key) {
      //     print(key + "==" + data.get(key).toString());
      //   });
      // });
      return finalCartDisplay!;
    } else {
      print("Entered into cart items");

      finalCartDisplay = (await SharedPreferencesHelper.getAddToCartData())!;
      if(count == 0){
        total();
      }
      
      //print('final addtocart is ${addToCart.isEmpty} ');
      //print('final addTocart length ${addToCart!.length}');

      print("Overall list length is ${allProductsList?.length}");
      print("Success");

      return finalCartDisplay!;
    }
  }

  void total() {
    print("Getting total Amount");
    finalCartDisplay!.forEach((element) {
      print('item price ${element.price}');
      if (element.isaddToCart == true) {
        subTotal = subTotal + element.price!;
      }
      print("$subTotal overall");
    });
    print("Total Amount has been Added $subTotal");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width / 2;
    print('Starting page');
    //print("addToCart value is ${addToCart!.isEmpty}");

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              setState(() {
               for(var i in finalCartDisplay!){
                 finalCartDisplay!.remove(i);
                 print(i);
               }
              });
            }, icon: Icon(Icons.clear))
          ],
            // leading: backArrow(context: context, routename: HomePage()),
            backgroundColor: Colors.black,
            elevation: 0,
            title: Center(child: text(name: "My Cart", color: Colors.red))),
        body: FutureBuilder<List<GroceryItem>?>(
            future: cartItems(false),
            builder: (context, snapshot) {
              if (snapshot.hasData ) {
                return ListView.separated(
                    shrinkWrap: true,
                    
                    itemBuilder: (context, index) {
                      // if (allProductsList![index].isaddToCart == true && finalCartDisplay![index].isaddToCart == true) {
                      //     finalCartDisplay!.addAll(allProductsList!);
                      //   cardProductPrice = finalCartDisplay![index].price!;
                      //   print(
                      //       'adding to final cart ${finalCartDisplay!.map((e) => e.name)}');
                      // } else {
                      //   Text('no Datas');
                      // }

                      if (finalCartDisplay![index].isaddToCart == true ) {
                            // cardProductPrice = finalCartDisplay![index].price!;
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: width * 0.4,
                                  child: Image.asset(
                                      finalCartDisplay![index].image!),
                                ),
                                desc(height,width,index),
                                SizedBox(
                                  height: height / 4,
                                  width: width * 0.60,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              print("Pressed OnTap outside");
                                              setState(() {
                                                print("Pressed OnTap");
                                                
                                                

                                                //finalCartDisplay![index].isaddToCart = false;
                                                allProductsList![index].isaddToCart = false;
                                                subTotal = subTotal - finalCartDisplay![index].price!.toInt();
                                                //subTotal = subTotal - finalCartDisplay![index].price!.toInt();
                                                finalCartDisplay!.removeAt(index);
                                                allProductsList!.removeAt(index);
                                                
                                                if(allProductsList![index].isaddToCart == false){
                                                  print("True value is ${allProductsList![index].name}");
                                                print("True value is ${allProductsList![index].isaddToCart}");}


                                                
                                                //SharedPreferencesHelper.addToCartData(finalCartDisplay!);
                                                SharedPreferencesHelper.addToCartData(allProductsList!);
                                                //SharedPreferencesHelper.remove(addToCart!.removeAt(index));

                                                // addToCart!
                                                //     .remove(addToCart![index]);
                                              });
                                            },
                                            child: const Icon(Icons.close)),
                                        const Spacer(),
                                        text(
                                            name: finalCartDisplay![index]
                                                .price
                                                .toString(),
                                            fontweight: FontWeight.bold)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if(allProductsList![index] == 0 ) {
                        return Center(child: Text('No Data'));
                      }
                      return Text('');
                    },
                    separatorBuilder: (context, index) {
                      if (finalCartDisplay![index].isaddToCart == true &&
                          allProductsList![index].isaddToCart == true) {
                        return Divider();
                      } else {
                        return SizedBox();
                      }
                    },
                    itemCount: finalCartDisplay!.length);
              } else {
                const Center(
                  child: Text("Loading"),
                );
              }
              return const Center(
                  child: Text("No Products are added to carts"));
            }),
        floatingActionButton: floatingButton(height, width));
  }

  Widget desc(height,width,index){
    return SizedBox(
                                  height: height / 4,
                                  width: width * 1.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        text(
                                            name: finalCartDisplay![index].name,
                                            fontweight: FontWeight.bold,
                                            fontSize: 15),
                                        text(
                                            name: finalCartDisplay![index]
                                                .description),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Material(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                elevation: 2,
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: InkWell(
                                                   
                                                    onTap: () => setState(() {
                                                      print(
                                                          "Number is decreasing");
                                                         finalCartDisplay![index].price = allProductsList![index].price! * finalCartDisplay![index].number!;
                                                          finalCartDisplay![index].number = finalCartDisplay![index].number! - 1;
                                                          
                                                          
                                                          SharedPreferencesHelper .addToCartData(finalCartDisplay!);  
                                                      // finalCartDisplay![index].number = (finalCartDisplay![index].number!) - 1;
                                                      //   // allProductsList![index]
                                                      //   //       .price =
                                                      //   //   allProductsList![
                                                      //   //               index]
                                                      //   //           .price! -
                                                      //   //       cardProductPrice;
                                                      // SharedPreferencesHelper.addToCartData(finalCartDisplay!);
                                                    }),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(width: 20),
                                            Text(finalCartDisplay![index]
                                                .number
                                                .toString()),
                                            const SizedBox(width: 20),
                                            Material(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                elevation: 2,
                                                child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: InkWell(
                                                      onTap: () {
                                                        subTotal  +=   finalCartDisplay![index].price!;
                                                         print("Subtotal after adding $subTotal");
                                                        setState(() {
                                                          count =1;
                                                          finalCartDisplay![index].price =allProductsList![index].price! * finalCartDisplay![index].number! ;
                                                          finalCartDisplay![index].number = finalCartDisplay![index].number! + 1;
                                                         
                                                          SharedPreferencesHelper .addToCartData(finalCartDisplay!);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                    ))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
  }

  Widget bottomvalue({name1, name2}) {
    return Row(
      children: [
        text(name: name1),
        const Spacer(),
        text(name: name2),
        const Icon(Icons.arrow_forward_ios_rounded)
      ],
    );
  }

  Widget floatingButton(height, width) {
   
    return FutureBuilder(
        future: cartItems(true),
        builder: (context, builder) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              text(
                                  name: 'CheckOut',
                                  fontSize: 30,
                                  fontweight: FontWeight.bold),
                              const Spacer(),
                              const Icon(Icons.close)
                            ],
                          ),
                          bottomvalue(
                              name1: 'Delivery', name2: 'Select Method'),
                          bottomvalue(name1: "Payment", name2: ' '),
                          bottomvalue(
                              name1: "Promo Code", name2: "Pick Discount"),
                          bottomvalue(
                              name1: "Total Cost", name2: subTotal.toString()),
                          button(
                              name: 'Place Order',
                              color: Colors.white,
                              btncolor: Colors.green,
                              height: height * 0.14,
                              width: width * 1.85,
                              context: context,
                              routename: const OrderAccepted())
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: height * 0.14,
              width: width * 1.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.green),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Go To Checkout',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Center(child: text(name: '\$$subTotal'.toString())),
                ],
              )),
            ),
          );
        });
  }
}
