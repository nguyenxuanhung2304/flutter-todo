import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/auth/sign_up_page.dart';

import 'package:flutter_todo/services/firebase_auth_service.dart';
import 'package:flutter_todo/components/button_widget.dart';
import 'package:flutter_todo/components/text_field_widget.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/constants.dart' as constants;
import 'package:flutter_todo/pages/home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isSignInButtonDisabled = true;
  final _signInFormKey = GlobalKey<FormState>();
  String? _emailErrorMsg;

  final _firebaseAuth = FirebaseAuthService();

  _handleSignInAccount() async {
    if (_signInFormKey.currentState!.validate()) {
      setState(() {
        _emailErrorMsg = null;
      });

      final navigator = Navigator.of(context);

      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            _email.text, _password.text);

        navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (Route<dynamic> route) => false);
      } on FirebaseAuthException catch (e) {
        setState(() {
          _emailErrorMsg = _getMessageFromErrorCode(e.code);
        });
      }
    }
  }

  String _getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case constants.userNotFound:
        return "No user found with this email.";
      case constants.wrongPassword:
        return "Email or password is invalid. Please try again";
      case constants.invalidEmail:
        return "Email address is invalid";
      default:
        return "Sign in failed. Please try again";
    }
  }

  _handleValidateTextField(newText) {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        _isSignInButtonDisabled = false;
      });
    } else {
      setState(() {
        _isSignInButtonDisabled = true;
      });
    }
  }

  Future<void> _handleSignInWithGoogle(context) async {
    try {
      final authService = FirebaseAuthService();
      await authService.signInWithEmailAndPassword(_email.text, _password.text);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } catch (e) {
      print(e);
    }
  }

  _gotoSignUpPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _signInFormKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "Sign In",
                fontSize: 32,
                opacity: 0.87,
                align: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23),
                child: TextFieldWidget(
                    controller: _email,
                    label: "Email",
                    hint: "Enter your Email",
                    errorMsg: _emailErrorMsg,
                    validator: (str) {
                      if (str == null || str.isEmpty) {
                        return "Enter a Email";
                      }

                      return null;
                    },
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextFieldWidget(
                    controller: _password,
                    label: "Password",
                    hint: "Enter your password",
                    type: constants.passwordField,
                    validator: (str) {
                      if (str == null || str.isEmpty) {
                        return "Enter your password";
                      }

                      return null;
                    },
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 18),
                child: ButtonWidget(
                    opacity: _isSignInButtonDisabled ? 0.5 : null,
                    onPressed:
                        _isSignInButtonDisabled ? null : _handleSignInAccount,
                    child: TextWidget(
                        text: "Sign in",
                        align: TextAlign.center,
                        opacity: _isSignInButtonDisabled ? 0.5 : 0.87)),
              ),
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xff979797))),
                  TextWidget(text: "or"),
                  Expanded(
                    child: Divider(color: Color(0xff979797)),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: ButtonWidget(
                      onPressed: () {
                        _handleSignInWithGoogle(context);
                      },
                      outline: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset('assets/images/google_logo.png'),
                          ),
                          const TextWidget(text: "Continue with Google"),
                        ],
                      ))),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 32, left: 15, right: 15),
                          child: ButtonWidget(
                              onPressed: () {
                                _gotoSignUpPage(context);
                              },
                              backgroundColor: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  TextWidget(
                                      text: "Don’t have an account?",
                                      color: Color(0xff979797),
                                      fontSize: 12),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: TextWidget(
                                        text: "Sign Up", fontSize: 12),
                                  ),
                                ],
                              )))))
            ],
          ),
        ),
      ),
    );
  }
}
