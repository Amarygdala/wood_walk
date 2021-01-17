import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:wood_walk/login.dart';
import 'package:wood_walk/profile.dart';
import 'package:wood_walk/water.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

void main() => runApp( MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => MyApp(),
        '/tree': (context) => Water(),
        '/profile': (context) => Profile(),
      },
  ));

class Weather extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
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
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _steps = '?';
  String _status = '?';
  int rain = 0;
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

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
      if(_status == 'stopped'){
        rain = 0;
      }else if(_status == 'walking'){

        rain = 50;
      }
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }


  int index = 0, n = 0;
  double percent = 0.0;

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
        body: Stack(
          children: [

            WeatherWidget(
                size:Size.infinite,
                weather:'Rainy',
                rainConfig:RainConfig(
                    rainNum: rain
                )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/tree${n%5}.png'),
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text('Stage $n'),
            Container(
              height: 50,
              width: 400,
              child: LiquidLinearProgressIndicator(
                value: percent, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.blue,
                borderWidth: 5.0,
                borderRadius: 12.0,
                direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text(((1-percent)*100).toInt().abs().toString() + "% until Stage " + (n+1).toString()),
              ),
            ),
          ],
        ),
        ),
    )
    );
  }
}