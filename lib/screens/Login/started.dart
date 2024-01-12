import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';
import 'SignIn.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({ Key? key }) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Image.asset(AppImages.homeBackgroundImage,fit: BoxFit.fill)),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width * 0.10,vertical: height * 0.1),
           //EdgeInsets.only(bottom: height * 0.1,left: width * 0.10,right: width * 0.10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            SizedBox(
              height: 50,
              child: Image.asset(AppImages.carrotImage)),
              const SizedBox(height: 5),
            text(name:'   Welcome\n to our store',
            color: Colors.white,fontSize: 40),
            const SizedBox(height: 5),
            text(name:'Get your groceries in as fast as one hour',
            color: Colors.white70,fontSize: 10),
            const SizedBox(height: 30),
            
            button(name:'Get Started', color:Colors.white, 
            btncolor:Colors.green,context: context,routename: const SignIn())
          ],),
        )
      ],),
    );
  }
}