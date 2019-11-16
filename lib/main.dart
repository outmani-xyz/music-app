import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Music App player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static AssetsAudio assetAudio = new AssetsAudio(
    asset: "sound.mp3",
    folder: "assets/sounds/",
  );
  AssetsAudioPlayer audioPlayer =new  AssetsAudioPlayer();
  bool isPaused = false;
  bool isFinished = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.play_arrow,
                  size: 50,
                ),
                onPressed: () {
                  if(!isPaused || isFinished){
                    audioPlayer.open(assetAudio);
                  }
                  audioPlayer.play();
                  isPaused = false;
                  isFinished = false;
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.pause,
                  size: 50,
                ),
                onPressed: () {
                  audioPlayer.pause();
                  isPaused = true;
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.stop,
                  size: 50,
                ),
                onPressed: () {
                  audioPlayer.stop();
                  isFinished = true;
                },
              ),
            ],
          ),
          
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
