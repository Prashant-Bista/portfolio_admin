import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';



List messages=[];
List contacts = [];
List firstNames= [];
List lastNames=[];
List emails=[];
var snapShots;
var logger = Logger();
Future getMessages() async{
  await FirebaseFirestore.instance.collection("messages").get().then((value){
    value.docs.forEach((element){
      messages.add(element.data()['message']);
    });
  });
  await FirebaseFirestore.instance.collection("messages").get().then((value){
    value.docs.forEach((element){
      firstNames.add(element.data()['first name']);
    });
  });
  await FirebaseFirestore.instance.collection("messages").get().then((value){
    value.docs.forEach((element){
      lastNames.add(element.data()['last name']);
    });
  });
  await FirebaseFirestore.instance.collection("messages").get().then((value){
    value.docs.forEach((element){
      emails.add(element.data()['email']);
    });
  });
  await FirebaseFirestore.instance.collection("messages").get().then((value){
    value.docs.forEach((element){
      contacts.add(element.data()['phone number']);
    });
  });

}
class ReadMessages extends StatefulWidget {

  const ReadMessages({super.key});
  @override
  State<ReadMessages> createState() => _ReadMessagesState();
}

class _ReadMessagesState extends State<ReadMessages> {

  @override
  void initState() {
    getMessages();
    print(messages.length);
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
            CustomAppbar(
              text: "Messages",
              imagePath: "assets/messagesappbar.jpg",
            )            ];
        },
body: ListView.builder(itemCount: messages.length,itemBuilder: (context, int index){
  if (messages.length ==0 ){
    return CircularProgressIndicator(
      backgroundColor: Colors.lightBlueAccent,
    );
  }
  else
  return Messages(index: index,firstname: firstNames[index], email: emails[index], message: messages[index],lastname: lastNames[index],contact: contacts[index],);

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
  final index;

  const Messages(
      {super.key,
      @required this.firstname,
      this.lastname,
      @required this.email,
      this.contact,
      @required this.message, this.index});

  @override
  Widget build(BuildContext context) {
    double widthDevice= MediaQuery.of(context).size.width;
    return             Wrap(children: [
      Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.blue,width: 5.0),left: BorderSide(color: Colors.blue,width: 5.0),right: BorderSide(color: Colors.blue,width: 5.0)),
            color: Colors.grey,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey)
            ]),
        child: Wrap(
          children: [
            SizedBox(width: 5,),
            RobotoText(
              size: 20,
              text: "${index+1}",
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
        width: widthDevice,
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
        child: RobotoText(text: "Message:\n $message",size: 20,),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.blue,width: 5.0),
            right: BorderSide(color: Colors.blue,width: 5.0),
          ),
          color: Colors.white

        ),
      ),
    ],);

  }
}