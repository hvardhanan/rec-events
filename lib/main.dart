import 'package:flutter/material.dart';
import 'package:rec_events/screens/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'REC Events',
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
