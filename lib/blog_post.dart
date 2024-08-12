import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_admin/components.dart';

Future DialogError(BuildContext context, String title, var icon) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        icon: icon,
            title: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ));
}

var logger = Logger();

class AddDataFirestore {
  CollectionReference table = FirebaseFirestore.instance.collection("articles");
  Future addData(String title, String body) async {
    await table.add({
      'title': title,
      'body': body,
    }).then((value) {
      logger.d("Success");
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
        endDrawer: Drawer(),
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CustomAppbar(
                text: "Write a blog",
                imagePath: "assets/blogappbar.jpg",
              )  ,
            ];
          },
          body: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Form(
                  key: formKey,
                  child: Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        BlogForm(
                          heading: "Title",
                          body: "Please enter the title of your blog",
                          maxLines: 1,
                          controller: _titleController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlogForm(
                          heading: "Content",
                          body:
                              "Please enter your content related to the title",
                          maxLines: 35,
                          controller: _contentController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: widthDevice / 2.1,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final toFirebase = AddDataFirestore();
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.reset();
                                  DialogError(context, "Success",Icon(Icons.check_circle,color: Colors.green,));
                                  if (await toFirebase.addData(
                                      _titleController.text,
                                      _contentController.text)==false) {
                                    DialogError(context, "Failed",Icon(Icons.report_gmailerrorred,color: Colors.red,));


                                  }
                                }
                              },
                              child: RobotoText(
                                text: "Post",
                                size: 20,
                                isbold: true,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ]))
            ],
          ),
        ));
  }
}
