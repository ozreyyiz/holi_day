import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: holiWhite,
      child: Center(
        child: Text("saved"),
      ),
    );
  }
}