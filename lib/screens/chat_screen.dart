import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/animations/fadeRoute.dart';
import 'package:snapchat/animations/slide_top_transition.dart';
import 'package:snapchat/screens/search_screen.dart';
import 'package:snapchat/screens/setting_screen.dart';

class ChatScreen extends StatelessWidget {
    
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
                child: Text('Chat',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20))
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
                      child: FaIcon(FontAwesomeIcons.solidCommentAlt,color: Colors.black54, size: 20)
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
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black26,
          ),
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {

            Color color = (index % 3 == 0) ? Colors.red : Colors.purple;
            String userName = (index % 3 == 0) ? "Britney" : "Rico";
            String userImg = (index % 3 == 0) ? "assets/friend-2.jpg" : "assets/friend-1.png";
            
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(userImg),
              ),
              title: Text(userName,style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: <Widget>[
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2)
                    )
                  ),
                  Text('  New snap • 2 min',style: TextStyle(color: color)),
                ]
              ),
              trailing: (index % 3 == 0)
                  ? Text('😊',textScaleFactor: 1.4)
                  : SizedBox(),
            );
          },
        )
      )
    );
  }
}