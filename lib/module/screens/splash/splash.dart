import 'dart:async';

import 'package:code_test/config/routes/routes.dart';
import 'package:code_test/module/screens/home/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, HOME_ROUTE));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Code Test",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
