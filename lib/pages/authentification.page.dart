import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  final TextEditingController txt_login = TextEditingController();
  final TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Authentification'),
        backgroundColor: Colors.pink, // Couleur personnalisée pour la barre d'app
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40), // Espace supplémentaire pour l'esthétique
            _buildTextField(txt_login, Icons.person, "Utilisateur"),
            SizedBox(height: 20), // Espacement entre les champs
            _buildTextField(txt_password, Icons.lock, "Mot de passe", isObscure: true),
            SizedBox(height: 40), // Espacement avant le bouton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50), // Hauteur du bouton
                primary: Colors.pinkAccent, // Couleur du bouton
              ),
              onPressed: () => _onAuthentifier(context),
              child: Text('Connexion', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hintText,
      {bool isObscure = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String psw = prefs.getString("password") ?? '';
    if (txt_login.text == "maha" && txt_password.text == "123") {
      prefs.setBool("connecte", true);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      final snackBar = SnackBar(content: Text('Vérifier votre identifiant et mot de passe'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
