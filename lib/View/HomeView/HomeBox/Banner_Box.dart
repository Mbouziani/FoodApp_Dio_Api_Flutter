import 'package:flutter/material.dart';

class BannerBox extends StatelessWidget {
  const BannerBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/peakyblinders-platters.jpg',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
