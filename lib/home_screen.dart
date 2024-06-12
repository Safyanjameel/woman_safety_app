import 'dart:math';

import 'package:flutter/material.dart';
import 'package:woman_safety_app/widget/home_widget/custom_appbar.dart';
import 'package:woman_safety_app/widget/home_widget/custom_carousel.dart';
import 'package:woman_safety_app/widget/home_widget/emergancy.dart';
import 'package:woman_safety_app/widget/home_widget/live_safe.dart';
import 'package:woman_safety_app/widget/home_widget/safehome/safehome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qIndex = 0;
  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }

  @override
  void initState() {
    getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              quotesIndex: qIndex,
              ontap: () => getRandomQuote(),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                children: const [
                  CustomCarousel(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Emergnacy",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Emergancy(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Explore LiveSafe",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  LiveSafe(),
                  SafeHome(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
