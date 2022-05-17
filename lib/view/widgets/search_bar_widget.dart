import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.5,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: holiBlack,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            prefixIconColor: holiBlack,
            filled: true,
            focusColor: holiWhite,
            fillColor: white,
            hoverColor: white,
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}