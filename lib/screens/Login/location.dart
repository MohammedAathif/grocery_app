import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';
import '../../widgets/widgets.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({ Key? key }) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height/2;
    //var width = MediaQuery.of(context).size.width/2;
    //var width = MediaQuery.of(context).size.width/2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: backArrow(context:context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(
            //alignment: Alignment.center,
            height: height * 0.40,
            child: Image.asset('assets/location.png')),
             SizedBox(height: height * 0.10),
          text(name: "Select your Location",fontweight: FontWeight.bold,fontSize: 30),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: text(name: "Switch on your location to stay in tune with  what's happening in your area")),
           SizedBox(height: height * 0.15),
          Container(
            alignment: Alignment.centerLeft,
            child: text(name: 'Your Zone')),
          const TextField(
            decoration: InputDecoration(hintText: 'Banasree'),
          ),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.centerLeft,
            child: text(name:'Your Area')),
          const TextField(
            decoration:  InputDecoration(hintText: 'Types of your Area'),
          ),
           SizedBox(height: height * 0.10),
          button(name: "Submit",color: Colors.white,btncolor: Colors.green,routename: HomePage(),context: context)
        ]),
      ),
    );
  }
}