import 'package:flutter/material.dart';
import 'package:needtochill/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Karla',
        cardColor: Color(0xFFf5f5f5),
        primaryColor: Color(0xFF0a1931),
        splashColor: Color(0xFF185adb),
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}

// This is for general styling
class Constants {
  // Here we say these colors are NEVER null
  static Color kBodyTextColor = Color(0xFF292929);
  static Color kButtonBgColor = Color(0xFFFFC947);

  // In this very case we will have to use the ! after color because Color? can be null because of thiese ?
  static TextStyle kBodyText = TextStyle(
    color: kBodyTextColor,
  );
}
