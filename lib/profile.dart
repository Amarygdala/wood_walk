import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: Container(
                      width: 240.0,
                      height: 240.0,
                      decoration: new BoxDecoration(
                        border: Border.all(width: 3.0, color: const Color(0xFFFFFFFF)),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  "assets/portrait.jpg")
                          )
                      )),
                ),
              ]
              ),
            ),
            //Logo here
            Padding(
              padding: EdgeInsets.fromLTRB(25, 350, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'Doe Johns',
                        style: TextStyle(
                          color: Colors.green[300],
                          letterSpacing: 2.0,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.drive_file_rename_outline,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'DATE JOINED',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'January 17, 2021 ',
                        style: TextStyle(
                          color: Colors.green[300],
                          letterSpacing: 2.0,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.access_alarms,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'EMAIL',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                  children: <Widget>[
                    Text(
                      'doe@htne.com ',
                      style: TextStyle(
                        color: Colors.green[300],
                        letterSpacing: 2.0,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                        Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
