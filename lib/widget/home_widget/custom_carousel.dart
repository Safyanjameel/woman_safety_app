import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woman_safety_app/utils/quotes.dart';
import 'package:woman_safety_app/widget/home_widget/safe_webview.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => route,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: List.generate(
          imageSliders.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  if (index == 0) {
                    navigateToRoute(
                        context,
                        SafeWebview(
                          url:
                              'https://gulfnews.com/world/asia/pakistan/womens-day-10-pakistani-women-inspiring-the-country-1.77696239',
                        ));
                  } else if (index == 1) {
                    navigateToRoute(
                        context,
                        SafeWebview(
                          url:
                              'https://www.unwomen.org/en/what-we-do/ending-violence-against-women',
                        ));
                  } else if (index == 2) {
                    navigateToRoute(
                        context,
                        SafeWebview(
                          url:
                              'https://blogs.unicef.org/blog/16-actions-girls-womens-safety-emergencies/',
                        ));
                  } else {
                    navigateToRoute(
                        context,
                        SafeWebview(
                          url:
                              'https://discoverymood.com/blog/characteristics-of-mentally-strong-women/',
                        ));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageSliders[index]),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent
                      ]),
                    ),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            articleTitle[index],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
        options: CarouselOptions(aspectRatio: 2.0, autoPlay: true),
      ),
    );
  }
}
