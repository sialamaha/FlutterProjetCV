import 'package:flutter/material.dart';
import 'dart:async';

import 'package:projetcv/pages/accueil.page.dart';
import 'package:projetcv/pages/authentification.page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthentificationPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/screen.jpg'),  // Votre logo ou image
            SizedBox(height: 20),
            CircularProgressIndicator(),  // Un indicateur de progression
          ],
        ),
      ),
    );
  }
}


