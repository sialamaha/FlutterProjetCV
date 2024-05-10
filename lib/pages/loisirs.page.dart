import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../menu/drawer.widget.dart'; // Assurez-vous que ce chemin est correct

class LoisirsPage extends StatefulWidget {
  @override
  _LoisirsPageState createState() => _LoisirsPageState();
}

class _LoisirsPageState extends State<LoisirsPage> {
  int hoveredIndex = -1; // Index du loisir survolé, -1 signifie aucun loisir survolé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      //appBar: AppBar(
        //title: Text("Loisirs"),
      //  backgroundColor: Colors.pink,
      //),
      body: Container(
        color: Colors.white, // Couleur de fond de la page des loisirs
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.sports_soccer,
                  // Exemple d'icône de loisir (à remplacer par l'icône souhaitée)
                  color: Colors.pink,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Loisirs',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Nombre de colonnes dans la grille
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildLoisirImage(Icon(Icons.photo_camera, color: Colors.white, size: 30), 'Photographie', 'assets/image/photographie.jpg', 0),
                  _buildLoisirImage(Icon(Icons.book, color: Colors.white, size: 30), 'Lecture', 'assets/image/lecture.jpg', 1),
                  _buildLoisirImage(Icon(Icons.videogame_asset, color: Colors.white, size: 30), 'Jeux vidéo', 'assets/image/jeux_video.jpg', 2),
                  _buildLoisirImage(Icon(Icons.movie, color: Colors.white, size: 30), 'Film', 'assets/image/film.jpg', 3),
                  _buildLoisirImage(Icon(Icons.pool, color: Colors.white, size: 30), 'Natation', 'assets/image/natation.jpg', 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoisirImage(Widget icon, String nomLoisir, String imagePath, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = -1),
      child: GestureDetector(
        onTap: () {
          // Gérer l'action lorsque l'utilisateur clique sur l'image du loisir
          // Vous pouvez ajouter une action ici, comme afficher un détail ou ouvrir une nouvelle page
        },
        child: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Visibility(
            visible: hoveredIndex == index,
            child: Container(
              alignment: Alignment.center,
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon, // Ajouter l'icône ici
                  SizedBox(height: 8),
                  Text(
                    nomLoisir,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
