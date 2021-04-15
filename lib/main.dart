import 'package:flutter/material.dart';
import 'package:platform/screens/splash/splash.dart';
import 'package:platform/screens/menu/menu.dart';
import 'package:platform/screens/pay/pay.dart';
import 'package:platform/screens/detail_item/detail_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: /*SplashScreen()*/ MenuScreen(),
      routes: {
        "menu": (context) => MenuScreen(),
        "detail": (context) => DetailItemScreen(),
        "pay": (context) => PayScreen()
      },
    );
  }
}
