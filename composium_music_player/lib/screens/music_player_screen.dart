import 'package:composium_music_player/constants.dart';
import 'package:composium_music_player/models/model_song.dart';
import 'package:composium_music_player/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../widgets/button.dart';
import '../widgets/music_control.dart';
import '../widgets/player_app_bar.dart';

class MusicPlayer extends StatelessWidget {
  static const routeName = '/music-player';
  const MusicPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: Container(),
            flex: 2,
          ),
          const Expanded(
            flex: 5,
            child: PlayerAppBar(),
          ),
          MusicControl(context),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Hero(
                tag: 'appbar',
                child: CustomAppBar(context),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
