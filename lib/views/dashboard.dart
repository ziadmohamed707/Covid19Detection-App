import 'package:covid19/views/about.dart';
import 'package:covid19/views/Egypt.dart';
import 'package:covid19/views/detict.dart';
import 'package:flutter/material.dart';
import 'package:covid19/views/world.dart';
import 'package:covid19/views/countries.dart';
import 'package:covid19/my_icons_icons.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int currentIndex = 0;
  final List<Widget> children = [
    DetictPage(),
    Egypt(),
    Country(),
    World(),
    About()
  ];
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: height * 0.02,
        iconSize: height * 0.035,
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_photo_alternate_outlined), label: "Detict"),
          BottomNavigationBarItem(
              activeIcon: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Icon(Icons.star),
              ),
              icon: Icon(Icons.star),
              label: "Home Country"),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Countries"),
          BottomNavigationBarItem(
            activeIcon: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: Icon(MyIcons.globe_1),
            ),
            icon: Icon(MyIcons.globe_1),
            label: "Global",
          ),
          BottomNavigationBarItem(
              activeIcon: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Icon(Icons.info),
              ),
              icon: Icon(Icons.info),
              label: "About")
        ],
      ),
      body: currentIndex == 0
          ? DetictPage()
          : children[currentIndex],
    );
  }
}
