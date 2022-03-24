import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

writeSongPrefs(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs
      .setString('songId', id)
      .whenComplete(() => print('$id written in storage'));
}

Future<String> getSongPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('songId');
}
