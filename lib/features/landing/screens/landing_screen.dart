import 'package:flutter/material.dart';
import 'package:whatsapp/commun/widgets/coustom_button.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';
import 'package:whatsapp/widgets/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome to ChitChat',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height / 11),
              Image.asset(
                'assets/images/bg.png',
                height: 320,
                width: 320,
                color: tabColor,
              ),
              SizedBox(height: size.height / 15),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                  style: TextStyle(color: greyColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: size.width * 0.85,
                  child: CoustomButton(
                    text: "Agree and Continue",
                    onPressed: () => navigateToLoginScreen(context),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
