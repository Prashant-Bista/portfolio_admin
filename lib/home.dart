import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: Text("Portfolio Admin pannel",style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic,fontFamily: "Roboto"),),
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
                  child: Text("Welcome Back, Mr. Prashant Bista",style: TextStyle(fontSize: 30,fontFamily: "roboto"),)),
              SizedBox(height: 20.0,),
              Center(child: Text("What would you like to do today?",style: TextStyle(fontSize: 30, fontFamily: "roboto"),textAlign: TextAlign.center,)),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.zero,
                      onPressed: (){},
                  child: SizedBox(
                    height: widthDevice/4.65,
                      child: Image.asset("assets/Blog.png",height: heightDevice/2.175,width: widthDevice/4.65,))),
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                  child: SizedBox(
                      height: widthDevice/4.15,
                      child: Image.asset("assets/Messages.png",height: heightDevice/2.175,width: widthDevice/4.65,)),
                  )
                ],
              )

            ],
          )

        ],
      ),
    );
  }
}
