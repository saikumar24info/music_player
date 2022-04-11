import 'package:audioplayers/audioplayers.dart';

class Controls {
  static void playSong(String url) {
    AudioPlayer player = AudioPlayer();
    player.play(url);
  }

  static void pauseSong(String url) {
    AudioPlayer player = AudioPlayer();
    player.pause();
  }
 
 
}