import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Navigator.pushNamed(context, "menu");

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("res/img/img_logo.png"),
        ),
      ),
    );
  }
}
