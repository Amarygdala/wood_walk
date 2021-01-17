import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wood_walk/textfield_widget.dart';
import 'button_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Image(
                          image: AssetImage('assets/logo.png'),
                          width: 200,
                        ),
                    ],
                  ),
                ),
                Text(
                  'Wood Walk',
                  style: TextStyle(
                    fontFamily: 'Abel',
                    fontSize: 56,
                  ),
                ),

              ],
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
                          color: Colors.green,
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
