import 'package:flutter/material.dart';
import 'package:projetcv/pages/InscriptionPage.dart';
import 'package:projetcv/pages/SplashScreen.dart';
import 'package:projetcv/pages/ThemeProvider.dart';
import 'package:projetcv/pages/accueil.page.dart';
import 'package:projetcv/pages/authentification.page.dart';
import 'package:projetcv/pages/competences.page.dart';
import 'package:projetcv/pages/contact.page.dart';
import 'package:projetcv/pages/diplomes.page.dart';
import 'package:projetcv/pages/experiences.page.dart';
import 'package:projetcv/pages/home.page.dart';
import 'package:projetcv/pages/loisirs.page.dart';
import 'package:projetcv/pages/portfolio.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  MyApp({super.key});

  Widget build(BuildContext context) {
    final themeProvider = Provider.of <ThemeProvider>(context);
    final routes = {

      '/home': (context) => HomePage(),
      '/inscription': (context) => InscriptionPage(),
      '/authentification': (context) => AuthentificationPage(),
      '/accueil': (context) => AccueilPage(),
      '/experiences': (context) => ExperiencesPage(),
      '/competences': (context) => CompetencesPage(),
      '/contact': (context) => ContactPage(),
      '/diplomes': (context) => DiplomesPage(),
      '/loisirs': (context) => LoisirsPage(),
      '/portfolio': (context) => PortfolioPage()
    };


    // This widget is the root of your application.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      routes: routes,
      home:
      //InscriptionPage(),
      AuthentificationPage(),
      //HomePage(),
      //SplashScreen()
    );
  }
}
