// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Database/database.dart';
import '../../Model/model.dart';
import '../../widgets/widgets.dart';

class Favourite extends StatefulWidget {
  Favourite({Key? key, this.addToFavorite}) : super(key: key);
  List<GroceryItem>? addToFavorite;

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<GroceryItem>? addToCart;


  Future<List<GroceryItem>?> getData() async {
    widget.addToFavorite = await SharedPreferencesHelper.getaddTofavoriteData()
        .whenComplete(() => print("Add to favourite item fetched"));
    return widget.addToFavorite;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    var heigth = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(child: text(name: "Favourite", color: Colors.black))),
      body: FutureBuilder<List<GroceryItem>?>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Image.asset(widget.addToFavorite![index].image!),
                    title: text(name: widget.addToFavorite![index].name),
                    subtitle:
                        text(name: widget.addToFavorite![index].description),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(children: [
                        text(
                            name:
                                widget.addToFavorite![index].price.toString()),
                        const Icon(Icons.arrow_forward_ios)
                      ]),
                    ),
                  );
                }),
                itemCount: widget.addToFavorite!.length,
              );
            } else {
              Center(child: text(name: 'Error While Loading Favourite Items '));
            }
            return const Center(child: Text( 'No Favourite Items Are Added'));
          }),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            if(widget.addToFavorite!.isEmpty){
              print("No Favourite items Are added");
            }else {
              widget.addToFavorite![0].isaddToCart = true;
            print(widget.addToFavorite![0].description);
            addToCart = List.from(widget.addToFavorite!);

            print('Added');
            print(addToCart?[0].description);

            SharedPreferencesHelper.addToCartData(addToCart!);

            SharedPreferencesHelper.removeFavourite();}
          });
        },
        child: Container(
          width: width * 1.85,
          height: heigth * 0.14,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.green),
          child: const Center(
              child: Text(
            'Add All To Cart',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
