import 'package:bct/pages/awareness_page.dart';
import 'package:bct/pages/camp_page.dart';
import 'package:bct/pages/home_page.dart';
import 'package:bct/pages/volunteers_page.dart';

import 'package:flutter/material.dart';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;

  final List _pages = [
    [HomePage(), 'Home'],
    [CampPage(), 'Camp'],
    [AwarenessPage(), 'Awareness'],
    [VolunteersPage(), 'Volunteers'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex][1],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),

      body: _pages[_currentIndex][0],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.red,

        index: _currentIndex,

        buttonBackgroundColor: Colors.redAccent,
        animationCurve: Curves.fastEaseInToSlowEaseOut,

        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home, color: Colors.white),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.bloodtype, color: Colors.white),
            label: 'Camp',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.campaign, color: Colors.white),
            label: 'Awareness',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person, color: Colors.white),
            label: 'Volunteers',
            labelStyle: TextStyle(color: Colors.white),
          ),

          // Icon(Icons.bloodtype, color: Colors.white),
          // Icon(Icons.campaign, color: Colors.white),
          // Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
