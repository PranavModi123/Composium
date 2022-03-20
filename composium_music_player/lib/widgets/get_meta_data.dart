import 'package:audiotagger/audiotagger.dart';
import 'package:composium_music_player/constants.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongData {
  FlutterAudioQuery audioQuery = FlutterAudioQuery();
  Audiotagger tagger = Audiotagger();
  int count = 0;
  intitalizePlayer() async {
    List<ArtistInfo> artists = await audioQuery.getArtists();
    audioQuery.getSongs().then((song) {
      for (int i = 0; i < song.length; i++) {
        Map map = {
          'id': song[i].id,
          'name': song[i].title,
          'artist': song[i].artist,
          'album': song[i].artist,
        };
        // allArtWork.add(getArtworkTag(song[i], artists));
        // print("Song[$i]:$map");
        allSongsList.add(map);
      }
    });
  }

  // Image getArtwork(SongInfo song, List<ArtistInfo> artists) {
  //   for (int i = 0; i < artists.length; i++) {
  //     if (artists[i].id == song.artistId) {
  //       if (artists[i].artistArtPath != null) {
  //         return Image.file(File(artists[i].artistArtPath));
  //       } else {
  //         audioQuery
  //             .getArtwork(type: ResourceType.ARTIST, id: artists[i].id)
  //             .then((artwork) {
  //           Image image = Image.memory(artwork);
  //           return image;
  //         });
  //       }
  //     }
  //   }
  // }

}
