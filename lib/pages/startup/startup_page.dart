import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/sign_up/sign_up_page.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  void _gotoSignUpPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignUpPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Opacity(
          opacity: 0.87,
          child: Text(
            "Welcome to UpTodo",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 30),
            margin: const EdgeInsets.only(left: 47, right: 47),
            child: const Opacity(
              opacity: 0.67,
              child: Text(
                "Please login to your account or create new account to continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xff8875FF),
                        minimumSize: const Size.fromHeight(40)),
                    child: const Text("LOGIN",
                        style: TextStyle(color: Colors.white)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _gotoSignUpPage(context);
                    },
                    style: OutlinedButton.styleFrom(
                      // backgroundColor: const Color(0xff8875FF),
                      minimumSize: const Size.fromHeight(40),
                      side: const BorderSide(
                          width: 2.0, color: Color(0xff8875FF)),
                    ),
                    child: const Text("CREATE ACCOUNT",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
