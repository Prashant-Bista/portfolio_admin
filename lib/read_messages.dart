import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';



List lst= [];
List messages=[];
List Contacts = [];
List firstnames= [];

var logger = Logger();

class ReadMessages extends StatefulWidget {

  const ReadMessages({super.key});
  @override
  State<ReadMessages> createState() => _ReadMessagesState();
}

class _ReadMessagesState extends State<ReadMessages> {
  Future getMessages() async{
    await FirebaseFirestore.instance.collection("messages").get().then((value){
      value.docs.forEach((element){
        lst.add(element.data()['message']);
      });
    });

  }
  @override
  void initState() {
    getMessages();
    // TODO: implement initState
    super.initState();
  }
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
body: ListView.builder(itemCount: lst.length,itemBuilder: (context, int index){

}),        ),
      );
  }
}

class Messages extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return             Wrap(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey)
            ]),
        child: Wrap(
          children: [
            SizedBox(width: 5,),
            RobotoText(
              size: 20,
              text: "1)",
              color: Colors.white,
            ),
            MessageHeading(label: "FirstName", data: firstname ,),
            MessageHeading(label: "LastName",data: lastname,),
            MessageHeading(label: "Email",data: email,),
            MessageHeading(label: "contact",data: contact,),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        color:Colors.white,
        child: RobotoText(text: "Message:\n dfslkfja;ljfa;lskjf;lakjsdf;asklfdjsa;ldfkjs;ldkfjdfal;jf;laksjfd;laksjf;laksjfd;lkjfdsa;lkfj",size: 20,),
      ),
    ],);

  }
}