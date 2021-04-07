import 'package:flutter/material.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.deepOrange,
      ),
      home: CategoryScreen(),
    );
  }
}


