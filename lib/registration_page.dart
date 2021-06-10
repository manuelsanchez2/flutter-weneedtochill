import 'package:flutter/material.dart';
import 'package:needtochill/bubble.dart';
import 'package:needtochill/logo.dart';
import 'package:needtochill/main.dart';
import 'package:needtochill/selection_page.dart';

class RegistrationPage extends StatelessWidget {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogo(),
                RegistrationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationCardState createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Card(
          elevation: 5,
          color: Theme.of(context).cardColor,
          child: SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SelectableText(
                    'What\'s your name?',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(
                        () {
                          name = value;
                        },
                      );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Constants.kBodyText.color?.withOpacity(0.1) ??
                          Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    child: Text('Send'.toUpperCase()),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Constants.kBodyText.color),
                      backgroundColor:
                          MaterialStateProperty.all(Constants.kButtonBgColor),
                    ),
                    onPressed: name.length > 3 && name.length < 10
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SelectionPage(name: name)));
                          }
                        : null,
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
