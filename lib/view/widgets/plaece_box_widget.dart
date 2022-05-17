import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceBox extends StatelessWidget {
  const PlaceBox({
    Key? key,
    required this.photoUrl,
    required this.header,
    required this.localizationCity,
    required this.localizationCountry,
  }) : super(key: key);
  final String photoUrl;
  final String header;
  final String localizationCity;
  final String localizationCountry;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(7),
                height: 90,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  header,
                                  style: GoogleFonts.nunito(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "$localizationCity , $localizationCountry",
                                  style: GoogleFonts.nunito(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}