import 'package:composium_music_player/models/model_song.dart';
import 'package:composium_music_player/screens/music_player_screen.dart';
import 'package:composium_music_player/screens/playlist_screen.dart';
import 'package:composium_music_player/widgets/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class DisplayMusicListView extends StatelessWidget {
  const DisplayMusicListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allSongsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            HapticFeedback.heavyImpact();
            print("kk id:${allSongsList[index]['id']}");
            Provider.of<ModelSong>(context, listen: false)
                .changeSong(allSongsList[index]);
            Navigator.pushNamed(context, MusicPlayer.routeName);
            writeSongPrefs(allSongsList[index]['id']);
          },
          title: Text(
            allSongsList[index]['name'],
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            allSongsList[index]['artist'],
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: CircleAvatar(
            backgroundImage: Image.asset(allArtWork[getRandomNumber()]).image,
          ),
          trailing: FocusedMenuHolder(
            openWithTap: true,
            menuBoxDecoration: BoxDecoration(color: Colors.black),
            onPressed: () {
              HapticFeedback.heavyImpact();
            },
            menuItems: <FocusedMenuItem>[
              FocusedMenuItem(title: const Text('Favourite'), onPressed: () {}),
              FocusedMenuItem(
                  title: const Text('add to Queue'), onPressed: () {}),
              FocusedMenuItem(
                  title: const Text('add to Playlist'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PlaylistDialogScreen();
                        });
                  }),
            ],
            child: IconButton(
              icon: Icon(menuButton),
            ),
          ),
        );
      },
    );
  }
}
