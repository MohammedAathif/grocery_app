
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_images.dart';

import 'MobileNumber.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
         Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (BuildContext context)=> LoginScreen()));
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height/2,
                width: width,
                child: Image.asset(AppImages.locationBgImage,fit: BoxFit.fitWidth)),
              const Text('Get your groceries \nwith nectar',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(context, 
                  // MaterialPageRoute(builder: (BuildContext context)=>const MobileNumber()));
                },
                child: const TextField()),
              Container(
                 alignment: Alignment.center,
                  child: const Text('Or connect with social media'),
              ),
          
              Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.lightBlue),
                  child: Center(child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     SizedBox(
                       height: 10,
                       width: 20,
                       child: Image.asset(AppImages.googleLogoImage)),
                      const Text('Continue with Google',style: TextStyle(color: Colors.white),),
                    ],
                  )),
                  
                ),
                 Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blueAccent),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     SizedBox(
                       height: 10,
                       width: 20,
                       child: Image.asset(AppImages.fbLogoImage)),
                      const Text('Continue with Facebook',style: TextStyle(color: Colors.white),),
                    ],
                  )),
                  
                )
            ],
          ),
        ),
      ),
    );
  }
}