import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class OnlyForKaan extends StatelessWidget {
  static String routeName = "/kaan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "KAAN this is for you!",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 23,
              ),
            ),
            // Text(
            //   "I love you ❤❤❤",
            //   style: TextStyle(
            //     color: Colors.pink,
            //     fontWeight: FontWeight.w900,
            //     fontSize: 30,
            //     decoration: TextDecoration.underline,
            //   ),
            // ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'I Love you Kaan ❤',
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.pink,
                    decoration: TextDecoration.underline,
                  ),
                  speed: const Duration(milliseconds: 300),
                ),
              ],

              totalRepeatCount: 100,
              pause: const Duration(milliseconds: 500),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}
