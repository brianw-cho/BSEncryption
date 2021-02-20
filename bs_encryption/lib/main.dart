import 'package:flutter/material.dart';
import 'package:bs_encryption/constants/color_constant.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        accentColor: kBlackColor
      ),
      home: HomeScreen,
    );
  }
}

