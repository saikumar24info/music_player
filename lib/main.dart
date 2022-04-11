// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/controls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: ListTile(
              title: Text('Play Music'),
              subtitle: Text('Enjoy yourself'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_sharp),
              ),
            ]),
        body: Container(
          color: Colors.black87,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 450,
                child: Image.asset(
                    "https://e7.pngegg.com/pngimages/103/460/png-clipart-orange-and-white-music-icon-hearing-audio-equipment-headphones-apps-google-music-orange-audio-equipment.png"),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.loop),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.list_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
                  IconButton(
                    onPressed: () {
                      Controls con = Controls();
                      Controls.playSong(
                          'https://s9.as09220309.in/2103152315/telv133ksk2lkvo/Tholi%20Prema%20-%20(2018)/[iSongs.info]%2002%20-%20Break%20The%20Rules.mp3');
                    },
                    icon: Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      Controls con = Controls();
                      Controls.pauseSong(
                          'https://s9.as09220309.in/2103152315/telv133ksk2lkvo/Tholi%20Prema%20-%20(2018)/[iSongs.info]%2002%20-%20Break%20The%20Rules.mp3');
                    },
                    icon: Icon(Icons.pause),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
