import 'package:flutter/material.dart';
import 'package:next_unicon/components/auth/signup_text.dart';
import 'login_view.dart';

// Define a custom Form widget.
class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {super.key});
  final bool isLoading;

  final void Function(String email, String password, String username,
      bool isLogin, BuildContext ctx) submitFn;

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final String backgroundImage = 'assets/images/1인 가구.jpg';
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 180,
              child: Image.asset(backgroundImage),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Welcome back!',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 7) {
                        return 'Please enter your Password at least 7 long.';
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
                if (!_isLogin)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        _userName = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 4) {
                          return 'Please enter your Character at least 4 long';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Username',
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
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          if (_isLogin) const Text('or'),
          // if (widget.isLoading) const CircularProgressIndicator(),
          ElevatedButton(
            onPressed: _trySubmit,
            child: Text(_isLogin ? 'Log in' : 'Submit'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_isLogin
                  ? 'Don\'t have an account?'
                  : 'Already have an account?'),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin ? 'Sign up' : 'Login',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
