import 'package:flutter/material.dart';

import 'UI/login/login_page.dart';
import 'UI/main/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AdminPanel(),
    );
  }
}