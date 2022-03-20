import 'package:composium_music_player/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/display_music_list_view.dart';

class AllMusicScreen extends StatefulWidget {
  AllMusicScreen({Key key}) : super(key: key);

  @override
  State<AllMusicScreen> createState() => AllMusicScreenState();
}

class AllMusicScreenState extends State<AllMusicScreen> {
  static const routeName = '/all-music-screen';
  bool isPlaylistExsist = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 65, bottom: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Hero(
              tag: 'appbar',
              child: CustomAppBar(context),
            ),
          ),
          isPlaylistExsist
              ? Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Colors.orange,
                )
              : Container(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              height: double.infinity,
              width: double.infinity,
              child: const DisplayMusicListView(),
            ),
          ),
        ],
      ),
    );
  }
}
