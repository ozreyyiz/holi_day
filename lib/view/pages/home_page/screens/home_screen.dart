import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/pages/onboarding_page/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: size.height,
            color: holiWhite,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppBarButton(
                            function: menuFunction,
                            icon: Icons.subject,
                          ),
                          AppBarButton(
                              function: menuFunction,
                              icon: Icons.notifications_none),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _headerText(
                          text: "Explore the", fontWeight: FontWeight.w300),
                      _headerText(
                          text: "Beautiful world!",
                          fontWeight: FontWeight.w800),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SearchBar(size: size),
                          SizedBox(width: 10),
                          TemplateButton(
                            borderRadius: BorderRadius.circular(15),
                            size: size,
                            height: size.width / 8,
                            width: size.width / 8,
                            child: GestureDetector(
                              child: Icon(
                                Icons.tune,
                                color: white,
                                size: size.width / 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Categories",
                        style: GoogleFonts.nunito(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _headerText({required String text, required FontWeight fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        fontSize: 33,
        fontWeight: fontWeight,
        color: holiBlack,
        letterSpacing: -0.5,
      ),
    );
  }
}

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

void menuFunction() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("showHome", false);
}

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
