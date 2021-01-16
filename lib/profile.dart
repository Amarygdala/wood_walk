import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wood_walk/textfield_widget.dart';

import 'button_widget.dart';

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
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.drive_file_rename_outline,
                          ),
                          Text(
                            ' Name:',
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          'Xiang Weng',
                      style: TextStyle(
                        fontSize: 21,
                      )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarms,
                          ),
                          Text(
                              ' Joined On:',
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          'April 23, 2021',
                          style: TextStyle(
                            fontSize: 21,
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline,
                          ),
                          Text(
                            ' Email:',
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          'xiang@htne.com',
                          style: TextStyle(
                            fontSize: 21,
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: 'Update Profile',
                    hasBorder: false,
                  ),
                  SizedBox(
                    height: 10.0,
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
