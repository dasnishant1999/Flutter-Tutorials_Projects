import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatelessWidget {
  Widget buildButton(int number, {Color color}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          final player = AudioCache();
          player.play('note$number.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildButton(1, color: Colors.red),
          buildButton(2, color: Colors.blue),
          buildButton(3, color: Colors.purple),
          buildButton(4, color: Colors.black),
          buildButton(5, color: Colors.yellow),
          buildButton(6, color: Colors.green),
          buildButton(7, color: Colors.blueGrey),
        ],
      ),
    );
  }
}
