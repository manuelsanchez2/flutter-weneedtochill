import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:needtochill/bubble.dart';
import 'package:needtochill/end_page.dart';
import 'package:needtochill/logo.dart';
import 'package:needtochill/main.dart';

class MeditationPage extends StatefulWidget {
  final int seconds;
  final String name;

  const MeditationPage({Key? key, required this.seconds, required this.name})
      : super(key: key);
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ClipPath(
              clipper: BubbleClipper(),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).splashColor,
                    ],
                    begin: Alignment(-0.8, -1),
                    end: Alignment(0.8, 1),
                    stops: [0.65, 1],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLogo(),
                    Card(
                      margin: const EdgeInsets.fromLTRB(0, 90, 30, 0),
                      child: SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontFamily: 'Karla',
                                      color: Theme.of(context).primaryColor),
                                  children: [
                                    TextSpan(text: 'You have chosen '),
                                    TextSpan(
                                        text: '${widget.seconds ~/ 60} mins '),
                                    TextSpan(
                                        text: 'meditation, ${widget.name}.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Press play when you are ready.',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MeditationCard(seconds: widget.seconds, name: widget.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeditationCard extends StatefulWidget {
  const MeditationCard({
    Key? key,
    required this.seconds,
    required this.name,
  }) : super(key: key);

  /// Number of seconds for meditation
  final int seconds;

  /// Name of the person who meditates today
  final String name;

  @override
  _MeditationCardState createState() => _MeditationCardState();
}

class _MeditationCardState extends State<MeditationCard> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int passedSeconds = 0;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void backwardsCount() async {
    while (widget.seconds > passedSeconds && isPlaying) {
      if (passedSeconds == 0 || passedSeconds % 300 == 0) {
        audioPlayer.setAsset('audios/gong-final.mp3');
        audioPlayer.play();
      }

      setState(() {
        passedSeconds++;
      });

      if (passedSeconds == widget.seconds) {
        // Final sound here
        audioPlayer.setAsset('audios/gong-final.mp3');
        audioPlayer.play();
        await Future.delayed(Duration(seconds: 1));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EndPage(name: widget.name),
          ),
        );
      } else {
        await Future.delayed(Duration(seconds: 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 450,
          margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/bong-meditation.png',
                scale: 0.7,
                width: 225,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${formatSecondsToMinutes(widget.seconds - passedSeconds)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Constants.kBodyText.color!,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: Theme.of(context).cardColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                onPressed: () {
                  if (!isPlaying && widget.seconds > passedSeconds) {
                    setState(() {
                      isPlaying = true;
                    });
                    backwardsCount();
                  } else {
                    setState(() {
                      isPlaying = false;
                    });
                  }
                },
                elevation: 5,
                child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatSecondsToMinutes(int value) {
  String minutes = (value ~/ 60).toString();
  if (minutes.length < 2) {
    minutes = '0' + minutes;
  }
  String seconds = (value - int.parse(minutes) * 60).toString();
  if (seconds.length < 2) {
    seconds = '0' + seconds;
  }
  return '$minutes:$seconds';
}
