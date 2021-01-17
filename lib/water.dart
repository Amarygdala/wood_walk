import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wood_walk/wave_widget.dart';

int index = 0;

class Water extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
        appBar: AppBar(
          title: const Text('My Tree'),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 10,
        ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green[300],
            elevation: 200,
            currentIndex: index, // this will be set when a new tab is tapped
            onTap: (index) {
              print(index);
              String s;
              if(index == 1) s = '/tree';
              else if (index == 2) s = '/profile';
              else s = '/home';
              Navigator.pushNamed(context, s);
            },
            items: [
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.grass_sharp,
                  color: Colors.white,
                ),
                label: 'Grow',
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.water_damage,
                  color: Colors.green,
                ),
                label: 'Water',
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
              Container(
                height: size.height - 200,
                color: Colors.blue,
              ),
              WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ],
        ),
      )
    )
    );
  }
}
