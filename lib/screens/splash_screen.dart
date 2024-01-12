import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_images.dart';
import 'Login/started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const StartingPage()));
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 60, child: Image.asset(AppImages.carrotImage)),
          const SizedBox(width: 10),
          Column(
            children: [
              const Text('nectar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Gilroy-Medium')),
              Row(
                children: const [
                  Text('o n l i n e',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  SizedBox(width: 5),
                  Text('g r o c e r i e s',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              )
            ],
          )
        ])
      ]),
    );
  }
}
