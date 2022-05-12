import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/pages/home_page/screens/detail_screen.dart';
import 'package:holi_day/view/pages/home_page/screens/home_screen.dart';
import 'package:holi_day/view/pages/home_page/screens/profile_screen.dart';
import 'package:holi_day/view/pages/home_page/screens/saved_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottom_navigation_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    DetailScreen(),
    SavedScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 20,
          currentIndex: currentIndex,
          unselectedItemColor: holiWhite,
          selectedItemColor: holiBlack,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(BottomNavigatonIcons.home),
              label: "as",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(BottomNavigatonIcons.save_instagram),
              ),
              label: "das",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(BottomNavigatonIcons.file),
              ),
              label: "das",
            ),
            BottomNavigationBarItem(
              icon: Icon(BottomNavigatonIcons.avatar),
              label: "das",
            ),
          ]),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: holiWhite,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.line_weight,
                color: holiBlack,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showHome", false);
              },
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.notifications_none,
                  color: holiBlack,
                ),
              ),
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: holiBlack,
      child: Icon(Icons.shopping_cart),
      onPressed: () {},
    );
  }
}
