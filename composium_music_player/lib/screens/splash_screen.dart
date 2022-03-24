import 'dart:async';
import 'package:composium_music_player/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:composium_music_player/models/model_song.dart';
import 'package:composium_music_player/screens/all_music_screen.dart';
import 'package:composium_music_player/widgets/get_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/shared_prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const routeName = '/splash-screen';

  @override
  void initState() {
    SongData().intitalizePlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Icon(
                  SplashMicIcon,
                  color: splashIconColor,
                  size: 40,
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.headline1,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      onFinished: () {
                        setCurrentSong();
                        Navigator.pushNamedAndRemoveUntil(context,
                            AllMusicScreenState.routeName, (route) => false);
                      },
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Composium',
                          speed: Duration(milliseconds: 150),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.20),
        ],
      ),
    );
  }

  void setCurrentSong() {
    getSongPrefs().then((value) {
      for (int i = 0; i < allSongsList.length; i++) {
        if (allSongsList[i]['id'] == value) {
          // print("Found ${allSongsList[i]['name']}");
          Provider.of<ModelSong>(context, listen: false).currentSong =
              allSongsList[i];
        }
      }
    });
  }
}
