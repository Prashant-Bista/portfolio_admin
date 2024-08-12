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

class CustomAppbar extends StatelessWidget {
  final text;
  final imagePath;
  const CustomAppbar({super.key, this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        size: 30.0,
        color: Colors.black,
        opacity: 1,
      ),
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(7.0)),
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: RobotoText(
            text: text,
            size: 24.0,
            isbold: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    )
    ;
  }
}

class HomeIcons extends StatelessWidget {
  final link;
  final imagePath;
  final text;

  const HomeIcons({super.key, this.link, this.imagePath, this.text});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.width;

    return Column(
      children: [
        MaterialButton(
          shape:ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(75.0)
          ),
          elevation: 50.0,
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          onPressed: (){
            Navigator.pushNamed(context, link);
          },
          child: SizedBox(
              height: widthDevice/4.15,
              child: Image.asset(imagePath,height: heightDevice/2.175,width: widthDevice/4.65,)),
        ),
        RobotoText(size: 25, text: text)
      ],
    );

  }
}


