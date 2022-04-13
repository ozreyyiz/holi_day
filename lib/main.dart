import 'package:flutter/material.dart';
import 'package:holi_day/view/pages/home_page/home_page.dart';
import 'package:holi_day/view/pages/onboarding_page/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Holi Day',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: showHome ? HomePage() : OnboardingPage());
  }
}
