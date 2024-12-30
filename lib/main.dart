import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rec_events/controllers/appwrite_controllers.dart';
import 'package:rec_events/screens/bottom_navbar.dart';
import 'package:rec_events/screens/login_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REC Events',
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
