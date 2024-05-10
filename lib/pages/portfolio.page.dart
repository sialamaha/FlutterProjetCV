import 'package:flutter/material.dart';
import '../menu/drawer.widget.dart';
class PortfolioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: Center(
        child: Text(
          'Page Portfolio',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
