import 'package:flutter/material.dart';
import 'package:needtochill/bubble.dart';
import 'package:needtochill/logo.dart';
import 'package:needtochill/meditation_page.dart';

class SelectionPage extends StatefulWidget {
  final String name;

  const SelectionPage({Key? key, required this.name}) : super(key: key);
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLogo(),
                  Card(
                    margin: const EdgeInsets.fromLTRB(0, 60, 30, 10),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, ${widget.name}',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Please choose the duration of today\'s session',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      MeditationCard(minutes: 5, name: widget.name),
                      MeditationCard(minutes: 10, name: widget.name),
                      MeditationCard(minutes: 15, name: widget.name),
                      MeditationCard(minutes: 20, name: widget.name),
                      MeditationCard(minutes: 25, name: widget.name),
                      MeditationCard(minutes: 30, name: widget.name),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MeditationCard extends StatelessWidget {
  const MeditationCard({
    Key? key,
    required this.minutes,
    required this.name,
  }) : super(key: key);
  final double minutes;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MeditationPage(seconds: (minutes * 60).toInt(), name: name),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          width: 180,
          height: 150,
          child: Column(
            children: [
              Image.asset(
                'images/bong-selection.png',
                scale: 0.9,
                height: 120,
              ),
              Text(
                '${minutes.toInt()} mins',
                style: TextStyle(
                  height: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
