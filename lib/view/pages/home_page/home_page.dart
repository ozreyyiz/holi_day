import 'package:flutter/material.dart';
import 'package:holi_day/core/constants/colors.dart';
import 'package:holi_day/core/widgets/bottom_navigation_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          unselectedItemColor: holiWhite,
          selectedItemColor: holiBlack,
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(BottomNavigatonIcons.avatar),
              label: "as",
            ),
            BottomNavigationBarItem(
              icon: Icon(BottomNavigatonIcons.home),
              label: "das",
            ),
          ]),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showHome", false);
              },
              icon: Icon(
                Icons.dangerous,
              ))
        ],
      ),
      body: Container(
        color: holiWhite,
        child: Center(
          child: Text("HOME"),
        ),
      ),
    );
  }
}
