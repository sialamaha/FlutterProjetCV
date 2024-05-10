import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../menu/drawer.widget.dart';

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        color: Colors.white,  // Couleur de fond de tout l'écran
        //padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/image/profil.jpg'),
            ),
            SizedBox(height: 40.0),
            Text(
              'Bonjour',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Je suis Siala Maha",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Étudiante en 2ème année génie informatique spécialité développement des systèmes informatiques",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            ElevatedButton.icon(
              onPressed: downloadCV,
              icon: Icon(Icons.download),
              label: Text('Télécharger mon CV'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadCV() async {
    final url = 'https://drive.google.com/file/d/1XyIlhKAdO6J4hUiA83U1ZoK5ztlhTVoI/view?usp=share_link'; // Remplacez par l'URL de votre CV
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer $url';
    }
}}
