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
          backgroundColor: Colors.lightBlue,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
                child: Container(
                    width: 240.0,
                    height: 240.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i1.rgstatic.net/ii/profile.image/846259942338566-1578775501342_Q512/Jordan_Wang.jpg")
                        )
                    )),
              ),
            ]
            ),
            //Logo here
            Padding(
              padding: EdgeInsets.fromLTRB(25, 330, 20, 0),
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
                        'Xiang Weng ',
                        style: TextStyle(
                          color: Colors.blue[200],
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
                  SizedBox(height: 25.0),
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
                          color: Colors.blue[200],
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
                  SizedBox(height: 25.0),
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
                      'xiang@htne.com ',
                      style: TextStyle(
                        color: Colors.blue[200],
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
