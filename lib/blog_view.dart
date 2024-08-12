import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        endDrawer: Drawer(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool isScrolled) {
            return <Widget>[
              CustomAppbar(
                text: "Blogs",
                imagePath: "assets/blogsreadappbar.jpg",
              )
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("articles")
                  .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(itemCount: snapShot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapShot.data!.docs[index];
                      return Blogs(title: document['title'],body: document['body'],);
                    },
                  );
                }
                else
                  return (Center(child: CircularProgressIndicator(),));
              }
          ),
        )
    );
  }
}
class Blogs extends StatefulWidget {
  final title;
  final body;

  const Blogs({super.key, this.title, this.body,});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  bool expand =false;
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              width: widthDevice/1.17,
              decoration:BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
              child: RobotoText(text: widget.title,size: 20,isbold: FontWeight.bold,color: Colors.white,),
            ),
            IconButton(onPressed: (){
              setState(() {
                expand= !expand;
              });
            }, icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.dangerous_outlined,color: Colors.red,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              width: widthDevice/1.17,
              decoration:BoxDecoration(
                border: Border.all(color: Colors.black,style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(3),

              ),
              child: Text( widget.body,style: TextStyle( fontSize: 15, fontFamily: "roboto"),maxLines:expand?null:5,overflow: expand?TextOverflow.visible:TextOverflow.ellipsis,),
            )
          ],
        ),
        SizedBox(height: 20,),

      ],
    );
  }
}



