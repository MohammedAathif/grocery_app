
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';
import 'package:grocery_app/widgets/widgets.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({ Key? key }) : super(key: key);

  @override
  State<OrderAccepted> createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  
  @override
  Widget build(BuildContext context) {
    
    var width = MediaQuery.of(context).size.width/2;
    var width2 = MediaQuery.of(context).size.width/2;
    var heigth = MediaQuery.of(context).size.height/2;
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Image.asset('assets/order_accepted.png',height: heigth * 1.0,width: width * 1.0,)),
        Expanded(child: Column(
          children: [
            text(name:'Your Order has Been Accepted',fontSize: 30,fontweight: FontWeight.bold),
            const SizedBox(height: 10),
            text(name: 'Your items has been placcd and is\n on it’s way to being processed',fontSize: 15)
          ],
        )),
        
        Expanded(child: Column(
          children: [
            button(name: 'Track Order',color: Colors.white,btncolor: Colors.green,width: width * 1.85,height:heigth * 0.14),
            button(name: 'Back To Home',routename: HomePage(pageIndex: 0),context: context)
          ],
        ))
      ]),
    );
  }
}