import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:wood_walk/login.dart';
import 'package:wood_walk/profile.dart';
import 'package:wood_walk/water.dart';
import 'package:weather_widget/WeatherWidget.dart';

void main() => runApp( MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => MyApp(),
        '/tree': (context) => Water(),
        '/profile': (context) => Profile(),
      },
  ));

class Weather extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherWidget(
            size: Size.infinite,
            weather: 'Thunder',
            thunderConfig:ThunderConfig(
                thunderWidth:12
            )
        )
    );
  }
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

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
        child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[300],
          elevation: 200,
          currentIndex: index, // this will be set when a new tab is tapped
          onTap: (index) {
            print(index);
            String s;
            if(index == 0) s = '/tree';
            else if (index == 1) s ='/home';
            else s = '/profile';
            Navigator.pushNamed(context, s);
          },
          selectedFontSize: 12.0,
          selectedItemColor: Colors.black54,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                  Icons.water_damage,
                  color: Colors.white),
              label: 'Water',
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.grass_sharp,
                color: Colors.green
              ),
              label: 'Grow',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.person,
                  color: Colors.white,
                ),
                label: 'Profile',
            )
          ],
        ),
        body: WeatherWidget(
            size:Size.infinite,
            weather:'Rainy',
            rainConfig:RainConfig(
                rainNum: 40
            )
        ),
        ),
    )
    );
  }
}