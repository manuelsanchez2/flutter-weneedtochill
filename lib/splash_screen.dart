import 'dart:async';
import 'package:flutter/material.dart';
import 'package:needtochill/registration_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'images/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            "# FREE & SIMPLE meditation app",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "for your daily practice!",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                wordSpacing: 2,
                                letterSpacing: 4),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
