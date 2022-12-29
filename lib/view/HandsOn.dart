import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HandsOn extends StatelessWidget {
  HandsOn({Key? key}) : super(key: key);
  final List<Map<String, String>> songList = [
    {"First Love" : "firstlove"},
    {"Lemon" : "lemon"},
    {"マリーゴールド" : "marigold"},
    {"KICKBACK" : "chainsawman"},
  ];

  final AudioCache _player = AudioCache();

  void playSong(String source) {
    _player.play(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "音楽リスト",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            for(int i = 0; i < songList.length; i++)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade100,
                        foregroundColor: Colors.deepOrange,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {
                        final source = songList.elementAt(i).values.first;
                        playSong("sounds/$source.mp3");
                      },
                      child: const Icon(Icons.play_arrow_outlined),
                    ),
                    Text(
                      songList.elementAt(i).keys.first,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
