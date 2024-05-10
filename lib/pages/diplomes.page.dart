import 'package:flutter/material.dart';

class DiplomesPage extends StatefulWidget {
  @override
  _DiplomesPageState createState() => _DiplomesPageState();
}

class _DiplomesPageState extends State<DiplomesPage> {
  int selectedDiplomeIndex = -1; // Index du diplôme sélectionné, -1 signifie aucun diplôme sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Couleur de fond de la page des compétences
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
        Row(
        children: [
        Icon(
          Icons.school,
          color: Colors.pink,
        ),
        SizedBox(width: 8.0),
            Text(
              'Diplômes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),]),
            SizedBox(height: 20),
            _buildDiplomeTile(
              'Diplôme d\'ingénieur spécialité Génie logiciel et informatique décisionnel',
              '2022/2025',
              'Institut International Technologie de Sfax',
              0,
            ),
            _buildDiplomeTile(
              'Licence en technologie de l\'informatique spécialité Développement des Systèmes d\'Information',
              '2018/2022',
              'Institut Supérieur des Etudes Technologiques de Sfax',
              1,
            ),
            _buildDiplomeTile(
              'Baccalauréat Science expérimentale',
              '2017/2018',
              'Lycée Habib Thameur de Sfax',
              2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiplomeTile(String titre, String annee, String lieu, int index) {
    bool isSelected = index == selectedDiplomeIndex;

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ExpansionTile(
        initiallyExpanded: isSelected,
        title: Text(titre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(annee),
        onExpansionChanged: (bool expanded) {
          setState(() {
            selectedDiplomeIndex = expanded ? index : -1;
          });
        },
        children: [
          ListTile(
            title: Text(
              lieu,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
