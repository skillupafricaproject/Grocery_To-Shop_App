import 'package:flutter/material.dart';

// Color lightScaffoldColor = const Color(0xFF4CAF50);
Color lightScaffoldColor = const Color(0xFF33691E);
Color lightFocusedColor = const Color(0xFFFFD740);
Color lightEnabledColor = const Color(0xFF4CAF50);
Color lightErrorColor = const Color(0xFFF44336);
//Color lightCardColor = const Color(0xFFFfFFFf);
Color lightCardColor = const Color(0xFFFFD740);
Color lightBackgroundColor = const Color(0xFFE0F7FA);
Color lightIconsColor = const Color(0xFFFFFFFF);
Color lightTextColor = const Color(0xff324558);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}
