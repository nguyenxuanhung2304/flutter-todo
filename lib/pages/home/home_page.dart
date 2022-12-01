import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/components/button_widget.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/pages/auth/sign_in_page.dart';
import 'package:flutter_todo/pages/auth/sign_up_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignInPage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TextWidget(text: "Home screen"),
      ),
      body: Column(
        children: [
          ButtonWidget(
            onPressed: _logout,
            backgroundColor: Colors.red,
            child: const TextWidget(text: "Logout"),
          )
        ],
      ),
    );
  }
}
