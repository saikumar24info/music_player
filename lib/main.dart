// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/songs_list.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 0;
  bool isPlaying = false;
  bool isLiked = false;
  IconData iconData = Icons.play_arrow;
  Duration position = Duration();
  Duration musicLength = Duration();
  String currentTime = "00:00";
  String completeTime = "00:00";
  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.white,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekTosec(value.toInt());
        });
  }

  AudioPlayer _player = AudioPlayer();
  AudioCache cache = AudioCache();
  void seekTosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  final List<String> _songs = [
    'https://s9.as09220309.in/2103152315/tely138nkr2ncsa/RRR%20-%20(2020)/[iSongs.info]%2005%20-%20Naatu%20Naatu.mp3',
    'https://s9.as09220309.in/2103152315/telv133ksk2lkvo/Tholi%20Prema%20-%20(2018)/[iSongs.info]%2002%20-%20Break%20The%20Rules.mp3',
    'https://s9.as09220309.in/2103152315/tejx139kje6nwp/Pushpa%20-%20(2021)/[iSongs.info]%2001%20-%20Daakko%20Daakko%20Meka.mp3',
    'https://s9.as09220309.in/2103152315/tejx139kje6nwp/Pushpa%20-%20(2021)/[iSongs.info]%2002%20-%20Srivalli.mp3',
    'https://s9.as09220309.in/2103152315/tejx139kje6nwp/Pushpa%20-%20(2021)/[iSongs.info]%2001%20-%20Pushpa%20BG%20Intro.mp3',
    ''
  ];

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });
    _player.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Music'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_sharp),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 350,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2018/04/30/13/18/music-app-icon-3362643_960_720.png",
                fit: BoxFit.fill,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.loop),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  color: Colors.white,
                ),
                IconButton(
                    icon: Icon(Icons.list_rounded),
                    color: Colors.white,
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SongsList()))
                        }),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 500.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    currentTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  slider(),
                  Text(
                    completeTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    _player.pause();

                    setState(() {
                      isPlaying = false;
                    });
                    if (i > 0) {
                      control(i - 1);
                      print(i);
                    }
                  },
                  icon: Icon(Icons.skip_previous),
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    control(0);
                  },
                  icon: Icon(iconData),
                  color: Colors.white,
                  iconSize: 45,
                ),
                IconButton(
                  onPressed: () {
                    _player.pause();
                    setState(() {
                      isPlaying = false;
                    });
                    if (i < _songs.length) {
                      control(i + 1);
                      print(i);
                    }
                  },
                  icon: Icon(Icons.skip_next),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  void control(int i) {
    if (!isPlaying) {
      _player.play(_songs[i]);
      setState(() {
        iconData = Icons.pause;
        isPlaying = true;
      });
    } else {
      _player.pause();
      setState(() {
        iconData = Icons.play_arrow;
        isPlaying = false;
      });
    }
  }
}
