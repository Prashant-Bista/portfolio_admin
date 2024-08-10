import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';

var logger = Logger();

class ReadMessages extends StatefulWidget {
  const ReadMessages({super.key});
  @override
  State<ReadMessages> createState() => _ReadMessagesState();
}

class _ReadMessagesState extends State<ReadMessages> {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: Drawer(),
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext conext, bool isScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 150,
                    height:30,
                    child: RobotoText(
                      text: "Your Messages",
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                background: Image.asset(
                  "assets/messagesappbar.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceAround,
              children: [
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.grey)
                      ]),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      RobotoText(
                        size: 20,
                        text: "1)",
                        color: Colors.white,
                      ),
                      MessageHeading(label: "FirstName", data: "Prashant" ,),
                      MessageHeading(label: "LastName",data: "Bista",),
                      MessageHeading(label: "Email",data: "bistaprashant1@gmail.com",),
                      MessageHeading(label: "contact",data: "9812345678",),

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Messages extends StatefulWidget {
  final firstname;
  final lastname;
  final email;
  final contact;
  final message;

  const Messages(
      {super.key,
      @required this.firstname,
      this.lastname,
      @required this.email,
      this.contact,
      @required this.message});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceAround,
        children: [
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: Colors.grey)
                ]),
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                RobotoText(
                  size: 20,
                  text: "1)",
                  color: Colors.white,
                ),
                MessageHeading(label: "FirstName", data: "Prashant" ,),
                MessageHeading(label: "LastName",data: "Bista",),
                MessageHeading(label: "Email",data: "bistaprashant1@gmail.com",),
                MessageHeading(label: "contact",data: "9812345678",),

              ],
            ),
          )
        ],
      )
            );
  }
}
