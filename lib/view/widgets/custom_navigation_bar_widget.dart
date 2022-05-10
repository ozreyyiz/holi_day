import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/widgets/bottom_navigation_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int currentIndex;
  CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 20,
          currentIndex: widget.currentIndex,
          unselectedItemColor: holiWhite,
          selectedItemColor: holiBlack,
          onTap: (index) => setState(() => widget.currentIndex = index),
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
    );
  }
}