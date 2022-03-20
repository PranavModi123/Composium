import 'package:composium_music_player/constants.dart';
import 'package:composium_music_player/models/model_song.dart';
import 'package:composium_music_player/widgets/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar(this.con, {Key key}) : super(key: key);
  BuildContext con;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size meidaQuery = MediaQuery.of(widget.con).size;
    return Neumorphic(
      style: customAppbarStyle(),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Image.asset(
                allArtWork[getRandomNumber()],
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextScroll(
                      Provider.of<ModelSong>(context).currentSong['name'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Flexible(
                    child: TextScroll(
                      Provider.of<ModelSong>(context).currentSong['artist'],
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  //TODO:implement play/pause animatation
                  //TODO:play pause music
                  HapticFeedback.heavyImpact();
                },
                child: NeumorphicIcon(playButton, size: 40),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  //TODO:implement play/pause animatation
                  //TODO:play pause music
                  HapticFeedback.heavyImpact();
                },
                child: NeumorphicIcon(emptyFavButton, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
