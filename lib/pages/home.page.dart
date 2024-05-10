import 'package:flutter/material.dart';
import 'package:projetcv/pages/ThemeProvider.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../menu/drawer.widget.dart';
import 'accueil.page.dart';
import 'competences.page.dart';
import 'contact.page.dart';
import 'diplomes.page.dart';
import 'experiences.page.dart';
import 'loisirs.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{
int _currentIndex = 0;

final List<Widget> _screens = [
  AccueilPage(),
  CompetencesPage(),
  DiplomesPage(),
  ExperiencesPage(),
  LoisirsPage(),
  ContactPage()
];

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('mon CV'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.brightness_7  // Icon for light theme
                    : Icons.brightness_4, // Icon for dark theme
                color: Colors.black,
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ]
  ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Competences',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Diplomes',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Experiences',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_football),
            label: 'Loisirs',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Contact',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    ),
  );
}}

class accueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Première partie avec un paragraphe',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Image.asset(
            'assets/image/profil.jpg', // Remplacez 'your_image.png' par le chemin de votre image
            width: 200.0,
            height: 200.0,
          ),
        ],
      ),
    );
  }
}

