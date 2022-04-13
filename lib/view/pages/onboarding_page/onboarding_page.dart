import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holi_day/view/pages/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) => setState(() {
              isLastPage = index == 2;
            }),
            children: [
              Container(
                decoration: onboardingPageDecoration(
                    imgsrc:
                        "https://images.pexels.com/photos/2184504/pexels-photo-2184504.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      OnboardingText(
                        thinText: "Let's make ",
                        boldText: "your dream vacation.",
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: onboardingPageDecoration(
                    imgsrc:
                        "https://images.pexels.com/photos/3185488/pexels-photo-3185488.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      OnboardingText(
                        thinText: "Find the       ",
                        boldText: "new places.",
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: onboardingPageDecoration(
                    imgsrc:
                        "https://images.pexels.com/photos/3214994/pexels-photo-3214994.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      OnboardingText(
                        thinText: "Explore the       ",
                        boldText: "Beautiful world!",
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isLastPage
                  ? Center(
                      child: Container(
                      width: size.width / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 246, 182, 86),
                            Colors.orange,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Colors.transparent),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool("showHome", true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
                        },
                        child: Text("Get Started"),
                      ),
                    ))
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          spacing: 20,
                          dotColor: Colors.amber.withOpacity(0.6),
                          activeDotColor: Colors.white,
                        ),
                        onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration onboardingPageDecoration({required String imgsrc}) {
    return BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
        image: NetworkImage(
          imgsrc,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}

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
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: thinText,
          style: GoogleFonts.nunito(
            fontSize: 50,
            fontWeight: FontWeight.w200,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        TextSpan(
            text: boldText,
            style: GoogleFonts.nunito(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8),
            ))
      ]),
    );
  }
}
