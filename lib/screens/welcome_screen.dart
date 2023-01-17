import 'package:flutter/material.dart';
import 'package:next_unicon/components/auth/signup_text.dart';
import 'package:next_unicon/screens/auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String backgroundImage = 'assets/images/1인 가구.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFDEDEDE),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Image(
                image: AssetImage(backgroundImage),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  child: const Text('Log in'),
                ),
              ),
              const SignUpText(),
            ],
          ),
        ),
      ),
    );
  }
}
