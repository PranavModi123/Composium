import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../constants.dart';
import '../models/model_song.dart';
import 'button.dart';

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(children: [
        Spacer(),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            ButtonWidget(
              icon: backArrowButton,
              size: 28,
              shape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
              onPressed: () {
                HapticFeedback.heavyImpact();
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PlAYING FROM',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextScroll(
                      Provider.of<ModelSong>(context).currentSong['album'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            ButtonWidget(
              icon: settingButton,
              size: 28,
              shape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
          ],
        ),
        Spacer(),
      ]),
    );
  }
}
