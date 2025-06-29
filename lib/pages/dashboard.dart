import 'package:bct/pages/awareness_page.dart';
import 'package:bct/pages/camp_page.dart';
import 'package:bct/pages/home_page.dart';
import 'package:bct/pages/volunteers_page.dart';
import 'package:flutter/material.dart';

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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.red,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bloodtype), label: 'Camp'),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Awareness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Volunteers',
          ),
        ],
      ),
    );
  }
}
