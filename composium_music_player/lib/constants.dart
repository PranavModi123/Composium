import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

String currentSongId = 'dummy';
Map currentSong = {};
List allSongsList = [];
List<String> allArtWork = [
  r'assets\gradient0.jpeg',
  r'assets\gradient1.jpeg',
  r'assets\gradient2.jpeg',
  r'assets\gradient3.jpg',
  r'assets\gradient4.jpg',
  r'assets\gradient5.jpg',
  r'assets\gradient6.jpg',
  r'assets\gradient7.jpg',
  r'assets\gradient8.jpg',
  r'assets\gradient9.jpg',
];

bool isCreatePressed = false;
Color scaffoldColor = const Color.fromARGB(255, 27, 27, 27);

//button colors
//UP
Color mainbuttonColorUp = const Color.fromARGB(255, 12, 12, 12);
Color shadowLightUp = const Color.fromARGB(20, 0, 0, 0);
Color shadowLightEmbossUp = const Color.fromARGB(255, 44, 34, 34);
Color shadowDarkUp = const Color.fromARGB(255, 5, 5, 5);
Color shadowDarkEmbossUp = const Color.fromARGB(255, 0, 0, 0);
//Down
Color mainbuttonColorDown = const Color.fromARGB(255, 12, 12, 12);
Color shadowLightDown = const Color.fromARGB(23, 0, 0, 0);
Color shadowLightEmbossDown = const Color.fromARGB(255, 44, 34, 34);
Color shadowDarkDown = const Color.fromARGB(255, 0, 0, 0);
Color shadowDarkEmbossDown = const Color.fromARGB(255, 0, 0, 0);

//Gradient Color
Color gradColor1 = Colors.black;
Color gradColor2 = Colors.grey;
Color gradColor3 = Colors.white;

//slider color
Color activeSliderColor = Colors.lime;
Color splashIconColor = Colors.lime;
Color inactiveSliderColor = Colors.black26;
//Icons
IconData addButton = Icons.add_rounded;
IconData checkButton = Icons.check_rounded;
IconData SplashMicIcon = Icons.mic_external_on_rounded;
IconData backArrowButton = Icons.arrow_back_ios_new_rounded;
IconData settingButton = Icons.menu;
IconData menuButton = Icons.more_vert_rounded;
IconData rewindButton = Icons.fast_rewind_rounded;
IconData forwardButton = Icons.fast_forward_rounded;
IconData playButton = Icons.play_arrow_rounded;
IconData pauseButton = Icons.pause_circle_filled_rounded;
IconData upButton = Icons.keyboard_arrow_up_rounded;
IconData filledFavButton = Icons.favorite_rounded;
IconData emptyFavButton = Icons.favorite_outline;

const dummyNames = [
  'playlist1',
  'playlist2',
  'playlist3',
  'playlist4',
  'playlist5',
];
//Returns a random number between 1 to 10
int getRandomNumber() {
  var random = Random();
  int randomNumber = random.nextInt(10);
  return randomNumber;
}

//shared prefrence

//AppBar customizations
Color lightBackgroundColor = Color(0xFFEDEEF2);
Color lightShadowColor = Color(0xFFDADFF0);
Color lightShadowColor1 = Color(0xFFFFFFFF);

NeumorphicStyle customAppbarStyle() {
  return NeumorphicStyle(
    depth: -3,
    intensity: 5,
    color: mainbuttonColorDown,
    shadowLightColor: shadowLightDown,
    shadowDarkColor: shadowDarkDown,
    shadowLightColorEmboss: shadowLightEmbossDown,
    shadowDarkColorEmboss: shadowDarkEmbossDown,
    shape: NeumorphicShape.concave,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
  );
}

ThemeData averageTheme(BuildContext context) {
  return ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 20,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w900,
          color: Colors.lime),
      headline2: TextStyle(
          fontSize: 18,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
          color: Colors.white),
      headline3: TextStyle(
          fontSize: 14,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
          color: Colors.white),
      headline4: TextStyle(
          fontSize: 12,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
          color: Colors.white),
      headline5: TextStyle(
          fontSize: 14,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
          color: Colors.lime),
      headline6: TextStyle(
          fontSize: 16,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w500,
          color: Colors.lime),
    ),
  );
}
