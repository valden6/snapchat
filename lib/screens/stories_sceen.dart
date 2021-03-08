import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/animations/fadeRoute.dart';
import 'package:snapchat/animations/slide_top_transition.dart';
import 'package:snapchat/screens/search_screen.dart';
import 'package:snapchat/screens/setting_screen.dart';
import 'package:snapchat/widgets/stories_screen_stories.dart';
import 'package:snapchat/widgets/stories_screen_subscriptions.dart';
import 'package:snapchat/widgets/stories_screens_discover.dart';

class StoriesScreen extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context, SlideRightRoute(page: SettingScreen())),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        backgroundImage: AssetImage("assets/avatar.jpg"),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                    GestureDetector(
                      onTap: () => Navigator.push(context, FadeRoute(page: SearchScreen())),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: FaIcon(FontAwesomeIcons.search,color: Colors.black54, size: 20)
                      ),
                    )
                  ]
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text('Stories',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20))
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon( Icons.person_add,color: Colors.black54)
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: FaIcon(FontAwesomeIcons.ellipsisH,color: Colors.black54, size: 20)
                    )
                  ]
                )
              )
            )
          ]
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Friends",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.plus,size: 15,color: Colors.purple),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            Text("My Story", style: TextStyle(fontWeight: FontWeight.bold))
                          ]
                        )
                      )
                    )
                  )
                ]
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              StoriesScreenStories(),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Subscriptions",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              StoriesScreenSubscriptions(),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Discover",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              StoriesScreenDiscover()
            ]
          )
        )
      )
    );
  }
}