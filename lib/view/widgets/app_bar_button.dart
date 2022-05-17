import 'package:flutter/material.dart';
import 'package:holi_day/view/constants/colors.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  final VoidCallback function;
  final IconData icon;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10)),
        child: Icon(widget.icon),
      ),
    );
  }
}