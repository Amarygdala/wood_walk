import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;

  ButtonWidget({this.title, this.hasBorder});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Colors.white : Colors.green,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
            ? Border.all(
              color: Colors.green,
              width: 1.0,
            )
          : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
           onTap: () {
             Navigator.pushNamed(context, "/home");
           },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Colors.green : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
