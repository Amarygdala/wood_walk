import 'package:flutter/cupertino.dart';

class ClipperWidget extends CustomClipper<Path>{

  final List<Offset> waveList;
  ClipperWidget({this.waveList});

  @override
  getClip(Size size) {
    final path = Path();
    path.addPolygon(waveList, false);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
  
}