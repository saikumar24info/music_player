// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongsList extends StatefulWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => player.play(
                  'https://s9.as09220309.in/2103152315/tely138nkr2ncsa/RRR%20-%20(2020)/[iSongs.info]%2005%20-%20Naatu%20Naatu.mp3'),
              child: Container(
                height: 50,
                color: Colors.grey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('[isongs.info] 01-Natu natu.mp3'),
                      InkWell(
                        onTap: (() => player.pause()),
                        child: Icon(Icons.pause),
                      ),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () => player.play(
                  'https://s9.as09220309.in/2103152315/tely138nkr2ncsa/RRR%20-%20(2020)/[iSongs.info]%2004%20-%20Dosti.mp3'),
              child: Container(
                  height: 50,
                  color: Colors.grey,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('[isongs.info] 02-Dosti.mp3'),
                        InkWell(
                          onTap: (() => player.pause()),
                          child: Icon(Icons.pause),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
