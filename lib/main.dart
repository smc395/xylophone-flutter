import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playNote(int noteNum) {
    player.play('note$noteNum.wav');
  }

  Transform buildKeyText(Text keyText, double angle) {
    return Transform.rotate(
      angle: angle,
      child: keyText,
    );
  }

  Expanded buildKey(int noteNum, Transform keyText, Color keyColor) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playNote(noteNum);
        },
        color: keyColor,
        child: keyText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // rotate text 90 degrees so that the xylophone can be played horizontally
    final angle = -1.570796;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, buildKeyText(Text('C'), angle), Colors.red),
              buildKey(2, buildKeyText(Text('D'), angle), Colors.orange),
              buildKey(3, buildKeyText(Text('E'), angle), Colors.yellow),
              buildKey(4, buildKeyText(Text('F'), angle), Colors.green),
              buildKey(5, buildKeyText(Text('G'), angle), Colors.blue),
              buildKey(6, buildKeyText(Text('A'), angle), Colors.indigo),
              buildKey(7, buildKeyText(Text('B'), angle), Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
