import 'package:composium_music_player/constants.dart';
import 'package:composium_music_player/models/model_song.dart';
import 'package:composium_music_player/screens/music_player_screen.dart';
import 'package:composium_music_player/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/all_music_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ModelSong(),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: averageTheme(context),
      initialRoute: SplashScreenState.routeName,
      routes: {
        AllMusicScreenState.routeName: (context) => AllMusicScreen(),
        SplashScreenState.routeName: (context) => SplashScreen(),
        MusicPlayer.routeName: (context) => MusicPlayer(),
      },
    );
  }
}
