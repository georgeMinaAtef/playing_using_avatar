import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Timer _timer;
  double left = 0.0;
  double top = 0.0;
  int seconds =  5 ;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic( Duration(seconds: seconds), (timer)
    {
      setState(() {
        left = getRandomPosition(context);
        top = getRandomPosition(context);
      });
    });
  }

  void _increaseTimer() {
    _timer = Timer.periodic( seconds >= 0 ? Duration(seconds: seconds - 1):Duration(seconds: seconds = 6), (timer) {
      setState(() {
        left = getRandomPosition(context);
        top = getRandomPosition(context);
      });
    });
  }

  double getRandomPosition(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final random = Random();

    // Generate a random position between 0 and the screen size minus widget size
    return random.nextDouble() * (screenWidth - 40);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text('Random Player'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: left,
              top: top,
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    _increaseTimer();
                    setState(() {

                    });
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}