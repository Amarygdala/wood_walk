import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({this.hintText, this.prefixIconData, this.suffixIconData, this.obscureText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 14.0,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Colors.blue,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue)
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Colors.blue,
        ),
        labelStyle: TextStyle(color: Colors.blue),
        focusColor: Colors.blue,
      ),
    );
  }
}
