import 'package:flutter/material.dart';
import 'package:needtochill/bubble.dart';
import 'package:needtochill/logo.dart';
import 'package:needtochill/main.dart';
import 'package:needtochill/selection_page.dart';

class EndPage extends StatefulWidget {
  final String name;

  const EndPage({Key? key, required this.name}) : super(key: key);
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              EndCard(widget: widget),
            ],
          ),
        ],
      ),
    );
  }
}

class EndCard extends StatelessWidget {
  const EndCard({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EndPage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Card(
          elevation: 5,
          color: Theme.of(context).cardColor,
          child: SizedBox(
            width: 225,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Congratulations!',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'You need to chill less now!',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'See you soon, ${widget.name}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'images/guy.png',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Constants.kBodyText.color),
                      backgroundColor:
                          MaterialStateProperty.all(Constants.kButtonBgColor),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectionPage(name: widget.name),
                        ),
                      );
                    },
                    child: Text('Home'.toUpperCase()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
