import 'package:flutter/material.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/pages/startup/startup_page.dart';
import 'package:flutter_todo/pages/welcome/welcome_three_page.dart';

class WelcomeTwoPage extends StatefulWidget {
  const WelcomeTwoPage({super.key});

  @override
  State<WelcomeTwoPage> createState() => _WelcomeTwoPageState();
}

class _WelcomeTwoPageState extends State<WelcomeTwoPage> {
  _gotoBackPage(context) {
    Navigator.pop(context);
  }

  _gotoNextPage(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const WelcomeThreePage()));
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
                    child: const Opacity(
                        opacity: 0.44, child: TextWidget(text: "SKIP")),
                  )
                ],
              ),
              Image.asset("assets/images/welcome_two.png"),
              Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const TextWidget(
                    text: "Create daily routine",
                    opacity: 0.87,
                    fontSize: 32,
                  )),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: const TextWidget(
                  text:
                      "In Uptodo you can create your personalized routine to stay productive",
                  opacity: 0.87,
                  fontSize: 16,
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 32, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    _gotoBackPage(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  child: const TextWidget(
                                    text: "BACK",
                                    opacity: 0.44,
                                    fontSize: 16,
                                  )),
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
