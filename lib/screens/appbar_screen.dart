 import 'package:flutter/material.dart';

class AppbarScreen extends StatelessWidget {
  const AppbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: Icon(Icons.menu), color: Color(0xFF800000), onPressed: () {}),
      title: Text(
        "TaskMind",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF800000),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon:  CircleAvatar(
            radius: 15,
            child: Icon(Icons.person, size: 18),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
