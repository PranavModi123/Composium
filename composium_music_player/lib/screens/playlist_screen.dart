import 'package:composium_music_player/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/create_playlist.dart';

class PlaylistDialogScreen extends StatelessWidget {
  const PlaylistDialogScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      alignment: Alignment.center,
      backgroundColor: Colors.black54,
      child: Container(
        height: 300,
        width: 240,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: dummyNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: ListTile(
                        tileColor: Colors.black38,
                        onTap: () {
                          //add to song id to playlist array
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content:
                                  Text('Song added to ${dummyNames[index]}'),
                            ),
                          );
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                        },
                        trailing: Icon(
                          filledFavButton,
                          color: Colors.lime,
                        ),
                        title: Text(
                          dummyNames[index],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                endIndent: 10,
                indent: 10,
                thickness: 2,
                color: Colors.grey,
              ),
              Expanded(flex: 1, child: createPlaylist()),
            ],
          ),
        ),
      ),
    );
  }
}
