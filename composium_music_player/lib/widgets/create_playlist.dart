import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class createPlaylist extends StatefulWidget {
  const createPlaylist({
    Key key,
  }) : super(key: key);

  @override
  State<createPlaylist> createState() => _createPlaylistState();
}

class _createPlaylistState extends State<createPlaylist> {
  TextEditingController playlistController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isCreatePressed
          ? Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    style: Theme.of(context).textTheme.headline4,
                    controller: playlistController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lime),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lime),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Enter playlist name',
                      labelStyle: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      //write new playlist to db
                      print('${playlistController.text}');
                       ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content:
                                  Text('${playlistController.text} created'),
                            ),
                          );
                      playlistController.clear();
                      HapticFeedback.heavyImpact();
                      setState(() {
                        isCreatePressed = false;
                      });
                    },
                    child: Icon(
                      checkButton,
                      color: Colors.lime,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                HapticFeedback.heavyImpact();
                setState(() {
                  isCreatePressed = true;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'Create Playlist',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Icon(addButton, color: Colors.lime),
                  Spacer(),
                ],
              ),
            ),
    );
  }
}
