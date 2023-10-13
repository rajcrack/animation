import 'package:flutter/material.dart';
import 'package:anime/shared/screenTitle.dart';
import 'package:anime/shared/tripList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                SizedBox(
                  height: 160,
                  child: ScreenTitle(text: 'Ninja Trips'),
                ),
                Flexible(
                  child: TripList(),
                )
                //Sandbox(),
              ],
            )));
  }
}
