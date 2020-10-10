import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Widget> getListOfXylophoneTileButtons() {
    List<Widget> xylophoneTiles = new List();
    List<MaterialColor> xylophoneTileColors = [
      Colors.red,
      Colors.deepOrange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];
    for (int soundNumber = 1; soundNumber <= 7; soundNumber++) {
      xylophoneTiles.add(getExpandedPlayableFlatButton(
          xylophoneTileColors[soundNumber - 1], soundNumber));
    }
    return xylophoneTiles;
  }

  Widget getExpandedPlayableFlatButton(
      MaterialColor colorValue, int soundNumber) {
    return Expanded(
      child: FlatButton(
        color: colorValue,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getListOfXylophoneTileButtons(),
          ),
        ),
      ),
    );
  }
}
