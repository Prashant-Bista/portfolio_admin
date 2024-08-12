import 'package:flutter/material.dart';
import 'package:portfolio_admin/components.dart';
class ProjectsUpload extends StatelessWidget {
  const ProjectsUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isTrue){
          return <Widget>[
CustomAppbar(
  text: "Upload Projects Here",
  imagePath: "assets/projetcsappbar.jpg",
)          ];
          
        },
        body: ListView(),
      ),
    );
  }
}
