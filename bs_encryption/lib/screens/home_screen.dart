import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        leading: Image.asset('assets/images/bank-icon.png'),
      ),

      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[

          ]
        )
      )
    );
  }
}