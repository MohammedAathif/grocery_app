// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height/2;
    var width = MediaQuery.of(context).size.width/2;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(height: height * 0.15),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:width*0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Image.asset(
                 AppImages.profileImage
                 ,height: 80,width: 80,fit: BoxFit.cover,
                 colorBlendMode: BlendMode.darken,),
                 const SizedBox(width: 20),
              Column(children: const [
                Text('Tester'),
             Text("Tester@gmail.com")
              ],),
             
            ],),
          ),
           SizedBox(height: height * 0.1),
          const Divider(),
          details(icon: Icons.money_outlined,name: "Orders"),
          const Divider(),
           details(icon: Icons.details,name: "My Details"),
          const Divider(),
           details(icon: Icons.location_on,name: "Delivery Address"),
          const Divider(),
           details(icon: Icons.payment,name: "Payment Methods"),
          const Divider(),
           details(icon: Icons.card_giftcard,name: "Promo Card"),
          const Divider(),
           details(icon: Icons.notifications,name: "Notifications"),
          const Divider(),
           details(icon: Icons.help,name: "Help"),
          const Divider(),
           details(icon: Icons.info,name: "About"),
          const Divider(),
           SizedBox(height: height * 0.4),
          button(name:"Log Out",color: Colors.green,btncolor: Colors.grey.shade300,context: context, routename: const SplashScreen())
          
          
        ]),
      ),
    );
  }
}