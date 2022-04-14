import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    Key? key,
    required this.thinText,
    required this.boldText,
  }) : super(key: key);

  final String thinText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            thinText,
            style: GoogleFonts.nunito(
              fontSize: 50,
              fontWeight: FontWeight.w200,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Text(
            boldText,
            style: GoogleFonts.nunito(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8),
            ),
          )
        ],
      ),
    );
  }
}
