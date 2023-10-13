import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState
    extends State<AnimatedCrossFadeExample> {
  final bool _first = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 3),
      firstChild: const FlutterLogo(
          style: FlutterLogoStyle.horizontal, size: 100.0),
      secondChild: const FlutterLogo(
          style: FlutterLogoStyle.stacked, size: 100.0),
      crossFadeState: _first
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
