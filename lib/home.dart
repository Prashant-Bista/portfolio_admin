import 'package:flutter/material.dart';
import 'package:portfolio_admin/components.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double widthDevice= MediaQuery.of(context).size.width;
    double heightDevice= MediaQuery.of(context).size.height;
    print("$widthDevice, $heightDevice");
    return Scaffold(
      extendBody: true,
      endDrawer: Drawer(
      child: Icon(Icons.menu),
        elevation: 20.0,
      ),
     
      body: Wrap(
       spacing: 10.0,
        runSpacing: 10.0,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),

              Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight:Radius.circular(50.0),bottomLeft: Radius.circular(50.0) ),
                      color: Colors.lightBlueAccent
                  ),
                  child: RobotoText(text: "Welcome Back, Mr. Prashant Bista",size: 30,),),
              SizedBox(height: 20.0,),
              Center(child: RobotoText(text: "What would you like to do?", size: 25,)),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeIcons(text: "Post",imagePath: "assets/Blog.png" , link: '/post',),
                  HomeIcons(text: "Messages",imagePath: "assets/Messages.png" , link: '/messages',),
                  HomeIcons(text: "Blogs",imagePath: "assets/blog_read.png" , link: '/view',),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeIcons(text: "UploadProjects",imagePath: "assets/upload_projects.png" , link: '/projects',),

                ],
              )

            ],
          ),

        ],
      ),
    );
  }
}
