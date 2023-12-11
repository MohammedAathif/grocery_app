// ignore_for_file: no_logic_in_create_state, file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../Model/model.dart';
import 'Profile.dart';
import 'Explore.dart';
import 'Home.dart';
import 'carts.dart';
import 'favourite.dart';

class HomePage extends StatefulWidget {
   HomePage({ Key? key,this.pageIndex = 0,this.value }) : super(key: key);
  int pageIndex ;
  List<GroceryItem>? value;
  @override
  State<HomePage> createState() => _HomePageState(value);
}

class _HomePageState extends State<HomePage> {
  List<GroceryItem>? item;
  _HomePageState(this.item);
  List pages = [];


  @override
  void initState(){

     pages =  [
    const Home(),
    const Explore(),
    const Carts(),
    Favourite(),
    const Account()
  ];
    
     item = widget.value;
     super.initState();
  }


  @override
  Widget build(BuildContext context) {
    

    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:pages[widget.pageIndex],
      
      
      
      bottomNavigationBar: bottomBar(),
    );
  }

   void _onItemTapped(int index) {  
    setState(() {  
      widget.pageIndex = index;  
    });  
  }  

  Widget bottomBar() {
  return BottomNavigationBar(
      // backgroundColor: ,
      // unselectedItemColor: ,
      selectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: widget.pageIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Account'),
      ]);
}
  
  
}