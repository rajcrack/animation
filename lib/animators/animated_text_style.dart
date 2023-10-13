import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleClass extends StatefulWidget {
  const AnimatedDefaultTextStyleClass({super.key});

  @override
  State<AnimatedDefaultTextStyleClass> createState() =>
      _AnimatedDefaultTextStyleClassState();
}

class _AnimatedDefaultTextStyleClassState
    extends State<AnimatedDefaultTextStyleClass> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedDefaultTextStyle(
        style: TextStyle(fontSize: 20),
        duration: Duration(seconds: 2),
        child: Text("bhh"));
  }
}
