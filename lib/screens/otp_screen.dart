import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rec_events/utils/app_styles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(20),
            Text(
              'Verify your OTP',
              style: Styles.headlineStyle1,
            ),
            const Gap(20),
            Text('Please check your email for OTP', style: Styles.headlineStyle3),
            const Gap(20),
            OtpTextField(
              numberOfFields: 6,
              showCursor: false,
              showFieldAsBox: true,
              borderColor: Styles.secondaryColor,
              focusedBorderColor: Styles.accentColor,
              disabledBorderColor: Colors.red,
              textStyle: const TextStyle(fontSize: 24),
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              },
            ),
            const Gap(20),
          ],
        ),
      ),
    ));
  }
}
