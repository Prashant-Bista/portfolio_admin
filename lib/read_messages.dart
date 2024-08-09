import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';
var logger= Logger();


class ReadMessages extends StatefulWidget {
  const ReadMessages({super.key});
  @override
  State<ReadMessages> createState() => _ReadMessagesState();
}

class _ReadMessagesState extends State<ReadMessages> {
  @override
  Widget build(BuildContext context) {
    double heightDevice= MediaQuery.of(context).size.height;
    double widthDevice= MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: Drawer(),
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext conext, bool isScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color:Colors.black,                    borderRadius: BorderRadius.circular(5),
                  ),
                  width:widthDevice/4.7 ,
                  height: heightDevice/20,
                  child: RobotoText(text: "Your Messages",size: 20,color: Colors.white,),
                ),
                background: Image.asset("assets/messagesappbar.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high,),
              ),
            )
          ];
        },
        body: ListView(
          children: [],
        ),
      ),
    );
  }
}
