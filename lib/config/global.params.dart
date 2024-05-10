import 'package:flutter/material.dart';

class GlobalParams{
  static
  List<Map<String,dynamic>>menus=[
    {"title":"Acceuil","icon":Icon(Icons.home,color: Colors.pink,),"route":"/home"},
    {"title":"Compétences","icon":Icon(Icons.sunny_snowing,color: Colors.pink,),"route":"/competences"},
    {"title":"Diplômes","icon":Icon(Icons.photo,color: Colors.pink,),"route":"/diplomes"},
    {"title":"Portfolios","icon":Icon(Icons.location_city,color: Colors.pink,),"route":"/portfolios"},
    {"title":"Expériences","icon":Icon(Icons.settings,color: Colors.pink,),"route":"/experiences"},
    {"title":"Loisirs","icon":Icon(Icons.settings,color: Colors.pink,),"route":"/loisirs"},
    {"title":"Contact","icon":Icon(Icons.contact_page,color: Colors.pink,),"route":"/contact"},
    {"title":"Deconnexion","icon":Icon(Icons.logout,color: Colors.pink,),"route":"/authentification"},
  ];
}