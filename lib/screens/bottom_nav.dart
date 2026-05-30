import 'package:flutter/material.dart';
import 'package:todo_app_project/screens/dashboard_screen.dart';
import 'package:todo_app_project/screens/profile_screen.dart';
import 'package:todo_app_project/screens/task_screen.dart';


class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  int currentIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const TaskScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF800000),

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items:  [

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Create",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}