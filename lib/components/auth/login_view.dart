import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter your Email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 7) {
                return 'Please enter your Email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }
}
