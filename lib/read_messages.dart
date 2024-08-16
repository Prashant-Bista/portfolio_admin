import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';

class ReadMessages extends StatefulWidget {
  const ReadMessages({super.key});
  @override
  State<ReadMessages> createState() => _ReadMessagesState();
}

class _ReadMessagesState extends State<ReadMessages> {
  bool _isLoading = true;
  List Ids=[];
  List messages = [];
  List contacts = [];
  List firstNames = [];
  List lastNames = [];
  List emails = [];
  var snapshot;
  var logger = Logger();
  Future getMessages() async {
    var doc = FirebaseFirestore.instance.collection("messages").doc().id;
    print(doc);
    try {
      snapshot =
      await FirebaseFirestore.instance.collection("messages").get();
      setState(() {
        for (var docs in snapshot.docs) {
          firstNames.add(docs.data()["first name"]);
          lastNames.add(docs.data()["last name"]);
          contacts.add(docs.data()["phone number"]);
          emails.add(docs.data()["email"]);
          messages.add(docs.data()["message"]);
        }
        _isLoading = false;
      });

    } catch (e) {
      logger.d("Failed to fetch data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
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
                )
              ];
            },
            body: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Messages(
                        // ID:ids[index],
                        index: index,
                        firstname: firstNames[index],
                        email: emails[index],
                        message: messages[index],
                        lastname: lastNames[index],
                        contact: contacts[index],
                      );
                    },
                  )));
  }
}

class Messages extends StatelessWidget {
  final id;
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
      @required this.message,
      this.index, this.id});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 50,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) ,),
              border: Border(
                  top: BorderSide(color: Colors.blue, width: 5.0),
                  left: BorderSide(color: Colors.blue, width: 5.0),
                  right: BorderSide(color: Colors.blue, width: 5.0)),
              color: Colors.grey,
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
          child: Column(
            children: [
              SizedBox(
                width: 5,
              ),
              Row(
                children:[ RobotoText(
                  size: 20,
                  text: "${index + 1}",
                  color: Colors.white,
                ),
                SizedBox(width: widthDevice/1.1,),
                IconButton(padding:EdgeInsets.zero,onPressed: () async{
                  return showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                        title: RobotoText(text: "Do you really want to delete the message",size: 20,color: Colors.black,),
                        icon: Icon(Icons.warning,color: Colors.yellow,),
                    actionsAlignment: MainAxisAlignment.spaceAround,

                    actions:[MaterialButton(onPressed: (){
                      Navigator.pop(context);
                  },child: RobotoText(size: 15, text: "Delete",color: Colors.red,)),MaterialButton(onPressed:() { Navigator.pop(context);},child: RobotoText(size: 15, text: "Cancel",color: Colors.black,))],
                  ),

                  );

                  // AlertDialog(
                  //     title: RobotoText(text: "Do you really want to delete the message",size: 20,color: Colors.black,),
                  //     icon: Icon(Icons.warning,color: Colors.yellow,),);
                  var snapshot= await FirebaseFirestore.instance.collection("message").where("phone number", isEqualTo: contact).get();
                  for (var doc in snapshot.docs){
                    print(doc.id);
                  }

                }, icon: Icon(Icons.delete),color: Colors.red,),
                ]
              ),
              MessageHeading(
                label: "FirstName",
                data: firstname,
              ),
              MessageHeading(
                label: "LastName",
                data: lastname,
              ),
              MessageHeading(
                label: "Email",
                data: email,
              ),
              MessageHeading(
                label: "contact",
                data: contact,
              ),
            ],
          ),
        ),

        Container(
          width: widthDevice,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:EdgeInsets.all(5),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                child: RobotoText(
                  text: "Message:",
                  size: 20,
                  isbold: true,
                  color: Colors.black,
                ),
              ),
              RobotoText(
                text: message,
                size: 20,
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.only(bottomLeft:  Radius.circular(10),bottomRight:  Radius.circular(10)) ,
              border: Border(
                left: BorderSide(color: Colors.blue, width: 5.0),
                right: BorderSide(color: Colors.blue, width: 5.0),
                bottom: BorderSide(color: Colors.blue, width: 5.0)
              ),
              color: Colors.white),
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}
