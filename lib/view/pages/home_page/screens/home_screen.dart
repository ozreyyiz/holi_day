import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holi_day/view/constants/colors.dart';
import 'package:holi_day/view/pages/onboarding_page/onboarding_page.dart';
import 'package:holi_day/view/widgets/app_bar_button.dart';
import 'package:holi_day/view/widgets/plaece_box_widget.dart';
import 'package:holi_day/view/widgets/search_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            _backgroundContainer(size),
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
                          children: [
                            AppBarButton(
                              function: _menuFunctionn,
                              icon: Icons.subject,
                            ),
                            AppBarButton(
                                function: (() {
                                  _menuFunction(context);
                                }),
                                icon: Icons.exit_to_app),
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
                        _smallHeader("Categories"),
                        SizedBox(height: 20),
                        _categories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _travelPlacesHeader(),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: _travelPlaces(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _travelPlacesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _smallHeader("Travel Places"),
        Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("View All"),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView _categories() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _selectedButton(),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl:
                  "https://img.icons8.com/external-filled-outline-icons-pause-08/344/external-balloon-travel2-filled-outline-icons-pause-08.png",
              header: "Sky Tour"),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl:
                  "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/344/external-desert-plants-flaticons-lineal-color-flat-icons-3.png",
              header: "Desert"),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl:
                  "https://img.icons8.com/external-filled-line-andi-nur-abdillah/344/external-pisa-landmark-filled-line-filled-line-andi-nur-abdillah.png",
              header: "Historical"),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl:
                  "https://img.icons8.com/emoji/344/beach-with-umbrella.png",
              header: "Beach"),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl: "https://img.icons8.com/fluency/344/5-star-hotel.png",
              header: "Hotel"),
          SizedBox(width: 20),
          _notSelectedButton(
              imageUrl: "https://img.icons8.com/color/344/nature.png",
              header: "Nature"),
        ],
      ),
    );
  }

  Row _travelPlaces() {
    return Row(
      children: const [
        PlaceBox(
          header: "Ayasofya Cami",
          localizationCity: "İstanbul",
          localizationCountry: "Turkey",
          photoUrl:
              "https://images.pexels.com/photos/3969150/pexels-photo-3969150.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        ),
        PlaceBox(
          header: "Cappadocia",
          localizationCity: "Nevşehir",
          localizationCountry: "Turkey",
          photoUrl:
              "https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        ),
        PlaceBox(
          header: "Leaning Tower of Pisa",
          localizationCity: "Pisa",
          localizationCountry: "Italy",
          photoUrl:
              "https://images.pexels.com/photos/1144276/pexels-photo-1144276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        ),
        PlaceBox(
          header: "Sahara Desert",
          localizationCity: "Africa",
          localizationCountry: "",
          photoUrl:
              "https://images.pexels.com/photos/1001435/pexels-photo-1001435.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        ),
      ],
    );
  }

  Text _smallHeader(String text) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _notSelectedButton(
      {required String imageUrl, required String header}) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            imageUrl,
            scale: 10,
          ),
          Text(
            header,
            style: GoogleFonts.nunito(
              color: holiBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Material _selectedButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [categoriesOrangeOne, categoriesOrangeTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https://img.icons8.com/external-rabit-jes-outline-color-rabit-jes/344/external-world-navigation-and-maps-rabit-jes-outline-color-rabit-jes.png",
              scale: 12,
            ),
            Text(
              "All",
              style: GoogleFonts.nunito(
                color: white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _backgroundContainer(Size size) {
    return Container(
      height: size.height,
      color: holiWhite,
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

void _menuFunction(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("showHome", false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => OnboardingPage()));
}

void _menuFunctionn() async {}
