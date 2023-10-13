import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;
  late Animation<double> _curve;

  bool isFav = false;

  @override
  void initState() {
    super.initState();

//  controller
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _curve = CurvedAnimation(
        parent: _controller, curve: Curves.slowMiddle);
//  color controller
    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red)
            .animate(_curve);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
// double  controller
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double?>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_curve);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: _colorAnimation.value,
                size: _sizeAnimation.value,
              ),
              onPressed: () {
                (isFav == true)
                    ? _controller.reverse()
                    : _controller.forward();

                // _controller.reverse();
              },
            ),
          ],
        );
      },
      // child: IconButton(
      //   icon: Icon(
      //     Icons.favorite,
      //     color: _colorAnimation.value,
      //     size: 30,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
