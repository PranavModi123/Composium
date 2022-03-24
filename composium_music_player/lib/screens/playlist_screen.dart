import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 5,
                  child: Text(
                    'All Playlist',
                    style: Theme.of(context).textTheme.headline5,
                  )),
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
