
import 'package:flutter/material.dart';
import 'package:shopping_app/LoginPage.dart';

void main() {
  runApp(MainMaterial());
}

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

