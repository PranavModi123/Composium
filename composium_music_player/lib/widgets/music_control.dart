import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../constants.dart';
import '../models/model_song.dart';
import 'button.dart';

Expanded MusicControl(BuildContext context) {
  Widget slider() {
    return Slider.adaptive(
      activeColor: activeSliderColor,
      inactiveColor: inactiveSliderColor,
      value: 0,
      min: 0,
      max: 100,
      onChanged: (value) {},
    );
  }

  return Expanded(
    flex: 30,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(allArtWork[getRandomNumber()]),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Expanded(
                              flex: 1,
                              child: TextScroll(
                                Provider.of<ModelSong>(context)
                                    .currentSong['name'],
                                mode: TextScrollMode.bouncing,
                                pauseBetween: Duration(seconds: 1),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextScroll(
                              Provider.of<ModelSong>(context)
                                  .currentSong['artist'],
                              mode: TextScrollMode.bouncing,
                              pauseBetween: Duration(seconds: 1),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          slider(),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 6.0, top: 10, bottom: 10, right: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Spacer(flex: 3),
                                    ButtonWidget(
                                      size: 28,
                                      icon: rewindButton,
                                      onPressed: () {
                                        HapticFeedback.heavyImpact();
                                        //change track
                                      },
                                      shape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(18),
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    ButtonWidget(
                                        size: 40,
                                        icon: playButton, //play pause update
                                        shape: NeumorphicBoxShape.circle(),
                                        onPressed: () {
                                          // change status
                                          HapticFeedback.heavyImpact();
                                        }),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    ButtonWidget(
                                      size: 28,
                                      icon: forwardButton,
                                      onPressed: () {
                                        HapticFeedback.heavyImpact();
                                        // widget.changeTrack(true);
                                      },
                                      shape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(18),
                                      ),
                                    ),
                                    Spacer(
                                      flex: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
