import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wood_walk/textfield_widget.dart';
import 'package:wood_walk/wave_widget.dart';

import 'button_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //Logo here
            Container(
              height: size.height - 200,
              color: Colors.blue,
            ),
            WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    title: 'Login',
                    hasBorder: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonWidget(
                    title: 'Sign Up',
                    hasBorder: true,
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
