import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/pages/home_page/home_page.dart';
import 'package:holi_day/view/pages/onboarding_page/widgets/onboarding_text_widget.dart';
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
                child: const DesignOnBoarding(
                  widget: OnboardingText(
                    thinText: "Let's make",
                    boldText: "your dream vocation",
                  ),
                ),
              ),
              Container(
                decoration: onboardingPageDecoration(
                    imgsrc:
                        "https://images.pexels.com/photos/3185488/pexels-photo-3185488.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                child: const DesignOnBoarding(
                  widget: OnboardingText(
                    thinText: "Find the       ",
                    boldText: "new places.",
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: onboardingPageDecoration(
                      imgsrc:
                          "https://images.pexels.com/photos/3214994/pexels-photo-3214994.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  child: DesignOnBoarding(
                      widget: OnboardingText(
                    thinText: "Explore the       ",
                    boldText: "Beautiful world!",
                  ))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isLastPage
                  ? Center(
                      child: TemplateButton(borderRadius: BorderRadius.circular(10),
                        height: 50,
                        width: size.width / 2,
                        size: size,
                        child: OnboardingGetStartedButton(),
                      ),
                    )
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
              SizedBox(height: 50),
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

class DesignOnBoarding extends StatelessWidget {
  const DesignOnBoarding({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widget,
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class TemplateButton extends StatelessWidget {
  const TemplateButton({
    Key? key,
    required this.size,
    required this.child,
    required this.width,
    required this.height, required this.borderRadius,
  }) : super(key: key);

  final Size size;
  final Widget child;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            gradientOrangeOne,
            gradientOrangeTwo,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class OnboardingGetStartedButton extends StatelessWidget {
  const OnboardingGetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: Colors.transparent),
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("showHome", true);
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      },
      child: Text("Get Started"),
    );
  }
}
