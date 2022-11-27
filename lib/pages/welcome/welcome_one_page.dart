import 'package:flutter/material.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/pages/startup/startup_page.dart';
import 'package:flutter_todo/pages/welcome/welcome_two_page.dart';

class WelcomeOnePage extends StatefulWidget {
  const WelcomeOnePage({super.key});

  @override
  State<WelcomeOnePage> createState() => _WelcomeOnePageState();
}

class _WelcomeOnePageState extends State<WelcomeOnePage> {
  _gotoNextPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const WelcomeTwoPage()));
  }

  _gotoStartupPage(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const StartupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _gotoStartupPage(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const TextWidget(
                      text: "SKIP",
                      opacity: 0.44,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              Image.asset("assets/images/welcome_one.png"),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: const TextWidget(
                  text: "Manage your tasks",
                  opacity: 0.87,
                  fontSize: 32,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: const TextWidget(
                    text:
                        "You can easily manage all of your daily tasks in DoMe for free",
                    fontSize: 16,
                    opacity: 0.87),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 32, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    _gotoNextPage(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff8875FF)),
                                  child: const TextWidget(text: "NEXT")),
                            ],
                          ))))
            ],
          )),
    );
  }
}
