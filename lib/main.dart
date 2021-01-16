import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<StepCount> _stepCountStream;
  String _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wood Walk'),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 10,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[300],
          elevation: 200,
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.water_damage),
              label: 'Water',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.grass_sharp),
              label: 'Grow',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
            )
          ],
        ),
        body: Center(
            child: Container(
              color: Colors.blue[400],
              padding: EdgeInsets.all(145),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                         Text(
                          'Steps taken:',
                          style: TextStyle(fontSize: 20),
                        ),
                         Text(
                          _steps,
                          style: TextStyle(fontSize: 30),

                      ),
                    ],
                  ),
//              Divider(
//                height: 100,
//                thickness: 0,
//                color: Colors.white,
//              ),
              ),
            ),
        ),
    );
  }
}