import 'package:flutter/material.dart';
import 'package:portfolio_admin/components.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: Drawer(),
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.bottomLeft,
                      height: heightDevice / 20,
                      width: widthDevice / 3.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RobotoText(
                        text: "Write Blogs here ",
                        size: 30,
                        color: Colors.white,
                        isbold: true,
                      )),
                  background: Image.asset(
                    "blogappbar.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RobotoText(
                                  size: 25,
                                  text: "Title",
                                  isbold: true,
                                ),
                                SizedBox(
                                  width: widthDevice / 1.1,
                                  child: TextFormField(
                                      validator: (text) {
                                        if (text.toString().length == 0) {
                                          return "Please Fill up this field";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Enter your title",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: Colors.lightBlueAccent,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              width: 0.5,
                                              style: BorderStyle.solid,
                                              color: Colors.lightBlue,
                                            ),
                                          ))),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RobotoText(
                                  size: 25,
                                  text: "Content",
                                  isbold: true,
                                ),
                                SizedBox(
                                  width: widthDevice / 1.1,
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text.toString().length == 0) {
                                        return "Please Fill up this field";
                                      }
                                    },
                                    maxLines: 20,
                                    decoration: InputDecoration(
                                      labelText:
                                          "Enter your blog content for the title",
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(width: widthDevice/2.1,),
                            ElevatedButton(
                              onPressed: () {
                                formKey.currentState!.validate();
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
                        SizedBox(height: 20,)
                      ]))
            ],
          ),
        ));
  }
}
