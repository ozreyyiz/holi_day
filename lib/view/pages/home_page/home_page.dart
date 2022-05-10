import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/widgets/custom_navigation_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottom_navigation_icons.dart';

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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: holiBlack,
        child: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
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
      body: Container(
        color: holiWhite,
        child: Center(
          child: Text("HOME"),
        ),
      ),
    );
  }
}
