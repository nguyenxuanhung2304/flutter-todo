import 'package:flutter/material.dart';
import 'package:flutter_todo/components/button_widget.dart';
import 'package:flutter_todo/components/text_field_widget.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/constants.dart' as constants;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _isRegisterButtonDisabled = true;
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _registerFormKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    controller: _username,
                    label: "Username",
                    hint: "Enter your Username",
                    validator: (str) {
                      if (str == null || str.isEmpty) {
                        return "Enter a username";
                      } else if (str.length < 6) {
                        return "Username is too short";
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
                padding: const EdgeInsets.only(top: 25),
                child: TextFieldWidget(
                    controller: _confirmPassword,
                    label: "Confirm Password",
                    hint: "Enter your confirm password",
                    type: constants.passwordField,
                    validator: (str) {
                      if (str == null || str.isEmpty) {
                        return "Enter your confirm password";
                      }

                      if (str != _password.text) {
                        return "Password and confirm password is not match";
                      }

                      return null;
                    },
                    onChanged: (value) => _handleValidateTextField(value)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 18),
                child: ButtonWidget(
                    opacity: _isRegisterButtonDisabled ? 0.5 : null,
                    onPressed: _isRegisterButtonDisabled
                        ? null
                        : _handleRegisterAccount,
                    child: TextWidget(
                        text: "Sign Up",
                        align: TextAlign.center,
                        opacity: _isRegisterButtonDisabled ? 0.5 : 0.87)),
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
                      onPressed: null,
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
              Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: ButtonWidget(
                      onPressed: null,
                      outline: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.facebook, color: Colors.white)),
                          TextWidget(
                            text: "Continue with Facebook",
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  _handleRegisterAccount() {
    if (_registerFormKey.currentState!.validate()) {
      print('register account');
      if (_password.text != _confirmPassword.text) {
        print('Password unmatches with confirm password');
      }
    }
  }

  _handleValidateTextField(newText) {
    if (_username.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _confirmPassword.text.isNotEmpty) {
      setState(() {
        _isRegisterButtonDisabled = false;
      });
    } else {
      setState(() {
        _isRegisterButtonDisabled = true;
      });
    }
  }
}
