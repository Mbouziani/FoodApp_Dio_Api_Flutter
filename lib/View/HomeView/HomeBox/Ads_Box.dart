import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsBox extends StatelessWidget {
  AdsBox({Key? key, required this.revere}) : super(key: key);

  List<String> UrlImageAds = [
    'assets/images.jpg',
    'assets/family-meal-deals-top-banner-100.jpg',
    'assets/images (1).jpg',
    'assets/peakyblinders-platters.jpg',
  ];
  final bool revere;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 4,
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          reverse: revere,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 4),
        ),
        itemBuilder: (context, index, realindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        UrlImageAds[index],
                      ),
                      fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      color: Color.fromARGB(117, 0, 0, 0),
                    )
                  ]),
            ),
          );
        });
  }
}
