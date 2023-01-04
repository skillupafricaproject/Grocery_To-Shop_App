import 'package:flutter/material.dart';

// Background image for forget password
Widget backgroundImage() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.black, Colors.black12],
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "images/lemon_bag.jpg"
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    ),
  );
}

// Background images for Signin and Signup
Widget backgroundImage1() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.black, Colors.black12],
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "images/begin_logo.jpg"
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    ),
  );
}

//The background Image for the main screens
Widget backgroundImage2() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.black, Colors.black12],
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "images/kiwi_semi_round.jpg"
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    ),
  );
}