
import 'package:flutter/material.dart';
class RobotoText extends StatelessWidget {
  final  size;
  final  isbold;
  final  text;
  final  color;
  const RobotoText({super.key, @required this.size, this.isbold, @required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color==null?Colors.black:color,fontFamily: "roboto",fontWeight: isbold!=null?FontWeight.bold:FontWeight.normal));
  }
}

