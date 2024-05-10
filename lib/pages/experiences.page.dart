import 'package:flutter/material.dart';

class ExperiencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Couleur de fond de la page Experiences
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.work,
                  color: Colors.pink,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Experiences',
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
              child: ListView(
                children: [
                  _buildExperienceCard(
                    title: 'Stage d\'été',
                    companyName: 'DEVSTY-IT',
                    date: '07/2023 - 09/2023',
                    description: 'Intégration d\'un équilibrage de charge pour un site',
                    keywords: '#devops, #docker, #kubernetes',
                  ),
                  _buildExperienceCard(
                    title: 'Stage de fin d\'études',
                    companyName: 'NEW ENGINEERING IT',
                    date: '02/2022 - 06/2022',
                    description: 'Développement d\'application Web Angular',
                    keywords: '#angular, #springboot, #html, #css3',
                  ),
                  _buildExperienceCard(
                    title: 'Stage de perfectionnement',
                    companyName: 'NEW ENGINEERING IT',
                    date: '01/2021 - 02/2021',
                    description: 'Développement d\'une application de supervision Android en Java Android',
                    keywords: '#android',
                  ),
                  _buildExperienceCard(
                    title: 'Stage d\'initiation',
                    companyName: 'EXIST',
                    date: '01/2019 - 02/2019',
                    description: 'Affichage des informations à Wordpress',
                    keywords: '#Wordpress',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String companyName,
    required String date,
    required String description,
    required String keywords,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$companyName • $date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Mots clés: $keywords',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pink[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
