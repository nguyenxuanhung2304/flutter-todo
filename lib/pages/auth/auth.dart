import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/shared_preferences_helper.dart';

import 'package:flutter_todo/pages/home/home_page.dart';
import 'package:flutter_todo/pages/startup/startup_page.dart';
import 'package:flutter_todo/pages/welcome/welcome_one_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => AuthState();
}

class AuthState extends State<Auth> {
  Future<bool> _loginCheckFuture = Future<bool>.value(false);
  bool _isViewedWelcomePage = false;

  @override
  void initState() {
    super.initState();
    _loginCheckFuture = _checkIfLoggedIn();
    SharedPreferencesHelper.getViewedWelcomePage().then((value) {
      setState(() {
        _isViewedWelcomePage = value;
      });
    });
  }

  Future<bool> _checkIfLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    return FutureBuilder(
        future: _loginCheckFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              child = const HomePage();
            } else {
              if (_isViewedWelcomePage) {
                child = const StartupPage();
              } else {
                child = const WelcomeOnePage();
              }
            }
          } else {
            child = const CircularProgressIndicator();
          }

          return Scaffold(
            body: child,
          );
        });
  }
}
