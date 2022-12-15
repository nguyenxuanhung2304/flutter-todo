import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_todo/helpers/form_validator_helper.dart';
import 'package:flutter_todo/pages/auth/sign_in_page.dart';
import 'package:flutter_todo/services/firebase_auth_service.dart';

import 'package:flutter_todo/components/button_widget.dart';
import 'package:flutter_todo/components/text_field_widget.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/constants.dart' as constants;
import 'package:flutter_todo/pages/home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _isSignUpButtonDisabled = true;
  final _registerFormKey = GlobalKey<FormState>();
  String? _emailErrorMsg;
  bool _isLoading = false;

  Future<void> _handleSignInWithGoogle(context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuthService().signInWithGoogle();

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  _handleRegisterAccount() async {
    if (_registerFormKey.currentState!.validate()) {
      setState(() {
        _emailErrorMsg = null;
      });

      final navigator = Navigator.of(context);

      try {
        await FirebaseAuthService()
            .createUserWithEmailAndPassword(_email.text, _password.text);
      } catch (e) {
        setState(() {
          _emailErrorMsg = "The email address is already being used.";
        });
      }

      navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  _gotoSignInPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignInPage()));
  }

  _handleValidateTextField(newText) {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _confirmPassword.text.isNotEmpty) {
      setState(() {
        _isSignUpButtonDisabled = false;
      });
    } else {
      setState(() {
        _isSignUpButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _registerFormKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextWidget(
                text: "Sign Up",
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
                    validator: FormValidatorHelper.emailValidator(),
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextFieldWidget(
                    controller: _password,
                    label: "Password",
                    hint: "Enter your password",
                    type: constants.passwordField,
                    validator: FormValidatorHelper.passwordValidator(),
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextFieldWidget(
                    controller: _confirmPassword,
                    label: "Confirm Password",
                    hint: "Enter your confirm password",
                    type: constants.passwordField,
                    validator: (confirmPassword) =>
                        FormValidatorHelper.confirmPasswordValidator(
                            _password.text, confirmPassword),
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 18),
                child: ButtonWidget(
                    opacity: _isSignUpButtonDisabled ? 0.5 : null,
                    onPressed:
                        _isSignUpButtonDisabled ? null : _handleRegisterAccount,
                    child: TextWidget(
                        text: "Sign Up",
                        align: TextAlign.center,
                        opacity: _isSignUpButtonDisabled ? 0.5 : 0.87)),
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
              _isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: SpinKitRing(color: Colors.white),
                    )
                  : Container(),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 32, left: 15, right: 15),
                          child: ButtonWidget(
                              onPressed: () {
                                _gotoSignInPage(context);
                              },
                              backgroundColor: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  TextWidget(
                                      text: "Already have an account?",
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
