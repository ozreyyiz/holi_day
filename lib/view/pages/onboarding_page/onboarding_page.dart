import 'package:flutter/material.dart';
import 'package:holi_day/view/pages/home_page/home_page.dart';
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
              Container(color: Colors.blue),
              Container(color: Colors.red),
              Container(color: Colors.black),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isLastPage
                  ? Center(
                      child: ElevatedButton(
                        onPressed: () async{


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
                        },
                        child: Text("data"),
                      ),
                    )
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 20,
                          dotColor: Colors.amber,
                          activeDotColor: Colors.green,
                        ),
                        onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
              SizedBox(height: size.height / 10),
            ],
          ),
        ],
      ),
    );
  }
}
