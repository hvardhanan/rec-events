import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rec_events/utils/app_styles.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(const AssetImage('assets/images/REC-transparent.png'), size: 200, color: Colors.indigo,),
            Text(
              'REC Events',
              style: Styles.headlineStyle1,
            ),
            Text(
              'One Stop for all events in REC',
              style: Styles.headlineStyle3,
            ),
            const Gap(20),
            const Gap(20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      backgroundColor: Styles.primaryColor,
    );
  }
}
