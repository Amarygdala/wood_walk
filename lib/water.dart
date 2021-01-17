import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wood_walk/wave_widget.dart';
import 'package:intl/intl.dart';

int index = 0;

class Water extends StatefulWidget {
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  DateTime now;
  Timer _everySecond;
  String formattedDate;

  @override
  void initState() {
    super.initState();

    // sets first value
    now = DateTime.now();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        now = DateTime.now();
        formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    var _dailyDrop;
    _dailyDrop = 666;
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
                    color: Colors.blue),
                label: 'Water',
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.grass_sharp,
                    color: Colors.white,
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
            children: <Widget>[
              //date and time
              Container(
                height: size.height - 200,
                color: Colors.blue,
              ),
              WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/water_page4.png'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(Icons.access_alarm),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(child: Text(formattedDate, textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Text(
                      'Daily:\n$_dailyDrop Drops',
                        style: TextStyle(
                          fontFamily: 'Abel',
                          fontSize: 42,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Lifetime:\n$_dailyDrop Drops',
                      style: TextStyle(
                        fontFamily: 'Abel',
                        fontSize: 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
              ]
      ),
            ],
        ),
      )
    )
    );
  }
}
