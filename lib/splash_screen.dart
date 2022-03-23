import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_square_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation _logoAnimation;
  late AnimationController _logoController;

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    _logoAnimation.addListener(() {
      if (_logoAnimation.status == AnimationStatus.completed) {
        return;
      }
      setState(() {});
    });

    _logoController.forward();
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 450,
              height: 300,
              child: Image.asset(
                "assets/logos2.jpg",
              )),
        ],
      ),
    );
  }
}
