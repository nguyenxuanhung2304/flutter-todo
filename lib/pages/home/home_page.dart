import 'package:flutter/material.dart';
import 'package:flutter_todo/components/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.black,
            bottomNavigationBar: ColoredBox(
              color: const Color(0xff363636),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.home_outlined),
                        text: "Home",
                      ),
                      Tab(
                        icon: Icon(Icons.calendar_month_outlined),
                        text: "Calendar",
                      ),
                      Tab(
                        icon: Icon(Icons.watch_later_outlined),
                        text: "Focuse",
                      ),
                      Tab(
                        icon: Icon(Icons.person_outlined),
                        text: "Profile",
                      ),
                    ]),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/filter.png'),
                  const TextWidget(
                    text: "Home",
                    fontSize: 20,
                    opacity: 0.87,
                  ),
                  Image.asset('assets/images/avatar.png')
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 60),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/checklist.png'),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextWidget(
                      text: "What do you want to do today?",
                      fontSize: 20,
                      opacity: 0.87,
                    ),
                  ),
                  const TextWidget(
                    text: "Tap + to add your tasks",
                    opacity: 0.87,
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                backgroundColor: const Color(0xff8875FF),
                onPressed: () {}, 
                child: const Icon(Icons.add),
              ),
            ),
          ),
        )
      ),
    );
  }
}
