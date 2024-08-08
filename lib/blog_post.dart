import 'package:flutter/material.dart';
class BlogPost extends StatefulWidget {

  const BlogPost({super.key}) ;

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthDevice= MediaQuery.of(context).size.width;
    double heightDevice= MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(),
      extendBodyBehindAppBar: true,
      body:NestedScrollView(

          headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.bottomLeft,
                    height: 25,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Text("Write blogs here",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                  background: Image.asset("blogappbar.jpg",fit: BoxFit.cover,),
                ),
              ),
            ];
          },
            body: ListView(
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Write the title of you")

                    ],
                ),
              )],

            ),

    )
    );
  }
}




