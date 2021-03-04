import 'package:flutter/material.dart';

class StoriesScreenStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: ListView.builder(
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {

          String userName = (index % 3 == 0) ? "Britney" : "Rico";
          String userImg = (index % 3 == 0) ? "assets/friend-story-2.jpg" : "assets/friend-story-1.jpg";
    
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {},
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.purple,width: 2)
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(userImg)
                    ),
                  )
                ),
                Padding(padding: EdgeInsets.only(top:4)),
                Text(userName, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
              ]
            )
          );
        }
      )
    );
  }
}