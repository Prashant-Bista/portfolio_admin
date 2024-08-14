import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
  List messages = [];
  List contacts = [];
  List firstNames = [];
  List lastNames = [];
  List emails = [];
  var snapShots;
  var logger = Logger();
  Future getMessages() async {
    try {
      var snapshot =
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
      this.index});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.blue, width: 5.0),
                  left: BorderSide(color: Colors.blue, width: 5.0),
                  right: BorderSide(color: Colors.blue, width: 5.0)),
              color: Colors.grey,
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
          child: Wrap(
            children: [
              SizedBox(
                width: 5,
              ),
              RobotoText(
                size: 20,
                text: "${index + 1}",
                color: Colors.white,
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
          child: RobotoText(
            text: "Message:\n $message",
            size: 20,
          ),
          decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.blue, width: 5.0),
                right: BorderSide(color: Colors.blue, width: 5.0),
              ),
              color: Colors.white),
        ),
      ],
    );
  }
}
