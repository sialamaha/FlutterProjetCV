import 'package:flutter/material.dart';

class CompetencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Couleur de fond de la page des compétences
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compétences',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 16),
              Text(
                'Je possède de solides compétences en langages de programmation et en différents frameworks',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Langages de programmation',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      _buildProgressBarRow('HTML', 80, Colors.purpleAccent),
                      _buildProgressBarRow('Angular', 70, Colors.blueAccent),
                      _buildProgressBarRow('Spring Boot', 90, Colors.pinkAccent),
                      _buildProgressBarRow('Flutter', 60, Colors.orangeAccent),
                      _buildProgressBarRow('CSS', 75, Colors.brown),
                      _buildProgressBarRow('Java', 85, Colors.redAccent),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Langues',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLanguageCircle('Arabe', 100, Colors.purpleAccent),
                      _buildLanguageCircle('Français', 70, Colors.pinkAccent),
                      _buildLanguageCircle('Anglais', 50, Colors.redAccent),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBarRow(String language, double percentage, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              language,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10, // Augmenter la hauteur de la barre de progression
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCircle(String language, double percentage, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              language,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${percentage.toInt()}%',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
