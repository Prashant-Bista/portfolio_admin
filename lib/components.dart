import 'package:flutter/material.dart';

class RobotoText extends StatelessWidget {
  final size;
  final isbold;
  final text;
  final color;

  const RobotoText(
      {super.key,
      @required this.size,
      this.isbold,
      @required this.text,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size,
            color: color == null ? Colors.black : color,
            fontFamily: "roboto",
            fontWeight: isbold != null ? FontWeight.bold : FontWeight.normal));
  }
}

class BlogForm extends StatelessWidget {
  final String heading;
  final String body;
  final int maxLines;
  final TextEditingController controller;
  const BlogForm(
      {super.key,
      required this.heading,
      required this.body,
      required this.maxLines,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RobotoText(
              size: 25,
              text: heading,
              isbold: true,
            ),
            SizedBox(
              width: widthDevice / 1.1,
              child: TextFormField(
                controller: controller,
                validator: (text) {
                  if (text.toString().length == 0) {
                    return "Please Fill up this field";
                  }
                },
                maxLines: maxLines,
                decoration: InputDecoration(
                  labelText: body,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      style: BorderStyle.solid,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0.5,
                      style: BorderStyle.solid,
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0.5,
                      style: BorderStyle.solid,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MessageHeading extends StatelessWidget {
  final label;
  final data;
  const MessageHeading({super.key, this.label, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50,),
        RobotoText(
          size: 20,
          text: label,
          color: Colors.white,
        ),
        RobotoText(
          size: 20,
          text: ":",
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        RobotoText(
          size: 20,
          text: data,
          color: Colors.white,
        ),
      ],
    );

  }
}

