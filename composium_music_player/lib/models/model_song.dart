import 'dart:io';

import 'package:composium_music_player/constants.dart';
import 'package:flutter/cupertino.dart';

class ModelSong extends ChangeNotifier {
  Map currentSong = allSongsList[0];

  void changeSong(Map songMap) {
    currentSong = songMap;
    notifyListeners();
  }
}
