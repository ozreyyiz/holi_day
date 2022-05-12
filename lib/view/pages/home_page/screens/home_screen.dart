import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/pages/onboarding_page/widgets/onboarding_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          color: holiWhite,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore the",
                    style: GoogleFonts.nunito(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: holiBlack,
                    ),
                  ),
                  Text(
                    "Beautiful world!",
                    style: GoogleFonts.nunito(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: holiBlack,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 1.5,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(cursorColor: holiBlack,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
