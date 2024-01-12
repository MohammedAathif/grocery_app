// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'package:grocery_app/utils/widgets.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({ Key? key }) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool signup = true;
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:20.0,left:20,right:10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            child: Image.asset(AppImages.carrotRedImage)),
            text(name: signup ? "Loging" : "Sign Up",fontweight: FontWeight.bold,fontSize: 20),
            text(name:signup ? "Enter your email and password" : "Enter your credentials to continue"),
            signup ? const SizedBox() : text(name: "Username") ,
            signup ? const SizedBox() : const TextField(),
            text(name: "Email"),
            const TextField(),
            text(name: "Password"),
            TextField(
              obscureText: _passwordVisible,
              decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: (){
                 setState(() {
                    _passwordVisible = !_passwordVisible;
                 });
                },
            icon: Icon(
           
               _passwordVisible
               ? Icons.visibility_off
               : Icons.visibility,
               color: Theme.of(context).primaryColorDark,
               ),
            ))),
            signup ? Container(
              alignment: Alignment.centerRight,
              child: text(name: "Forgot Password?")) : 
            text(name: 'By Continuing you agree to out Terms of Service and Privacy Policy'), 
            button(name: signup ? 'Log In' : 'Sign Up',
            color: Colors.white,
            btncolor: Colors.green,
            routename: HomePage(),context: context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              text(name: signup ? "Don't have an account?" : "Already have an account?"),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: (){
                  setState(() {
                    signup = !signup;
                  });
                },
                child: text(name:signup ? "SignUp" : "LogIn",color: Colors.green))
            ],)
        ]),
      ),
    );
  }
}