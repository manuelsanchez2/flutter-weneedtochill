import 'dart:math';

import 'package:flutter/material.dart';
import 'package:needtochill/main.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 2 * pi / -50,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 60, 0, 0),
        child: Text(
          '#Weneed\ntochill'.toUpperCase(),
          style: TextStyle(
            shadows: [
              Shadow(
                color: Constants.kBodyText.color!.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            height: 1,
            fontFamily: 'Anton',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
