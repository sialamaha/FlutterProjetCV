import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MapScreen.page.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Message envoyé'),
          content: Text('Merci pour votre message, il a été envoyé.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      _formKey.currentState!.reset();
    }
  }

  void _openMaps() async {
    const url = 'https://maps.google.com/?q=IIT+Sfax';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.mail, color: Colors.pink),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Contact', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildContactCard(),
            SizedBox(height: 20),
            _buildMessageForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard() => Card(
    elevation: 4,
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contactInfo('Email: mahasaiala@gmail.com'),
          _contactInfo('Téléphone: +216 20 866 641'),
          Row(
            children: [
              Text('Adresse: ', style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.map, color: Colors.pink),
                  onPressed: (){
                    _openMaps();
                  }
              ),
            ],
          ),
          _socialMediaIcons(),
          _qrCode(),
        ],
      ),
    ),
  );

  Widget _buildMessageForm() => Card(
    elevation: 4,
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Votre email'),
              validator: (value) => value!.isEmpty ? 'Veuillez saisir votre email' : null,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Écrivez votre message ici'),
              validator: (value) => value!.isEmpty ? 'Veuillez saisir votre message' : null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _contactInfo(String text) => Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Text(text, style: TextStyle(fontSize: 18)),
  );

  Widget _socialMediaIcons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildSocialMediaIcon(Icons.linked_camera, 'https://www.instagram.com/sialamaha/'),
      _buildSocialMediaIcon(Icons.facebook, 'https://www.facebook.com/siala.maha.7'),
      _buildSocialMediaIcon(Icons.incomplete_circle_outlined, 'https://www.linkedin.com/in/maha-siala/'),
    ],
  );

  Widget _buildSocialMediaIcon(IconData iconData, String url) => GestureDetector(
    onTap: () => launch(url),
    child: Icon(iconData, color: Colors.pink, size: 30),
  );

  Widget _qrCode() => Container(
    alignment: Alignment.center,
    child: Image.asset('assets/image/My_PDF.png', height: 100, width: 100),
  );
}
