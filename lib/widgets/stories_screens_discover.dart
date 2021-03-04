import 'package:flutter/material.dart';

class StoriesScreenDiscover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {

          String discName = (index % 3 == 0) ? "This Actress Has Made The Nicest Thing" : "This New Book Is So Wonderful";
          String discDate = (index % 3 == 0) ? "Today" : "6h ago";
          String discImg = (index % 3 == 0) ? "assets/discover-1.jpg" : "assets/discover-2.jpg";
    
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            margin: EdgeInsets.all(4),
            color: Colors.transparent,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                        image: AssetImage(discImg),
                        fit: BoxFit.fill
                      )
                    )
                  )
                ),
                Positioned(
                  left: 0,
                  bottom: 35,
                  height: 35,
                  width: 183,
                  child: Container(
                    margin: EdgeInsets.only(left:6, right: 6),
                    child: Text(discName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  )
                ),
                Positioned(
                  left: 0,
                  bottom: 15,
                  height: 15,
                  width: 183,
                  child: Container(
                    margin: EdgeInsets.only(left:6, right: 6),
                    child: Text(discDate, style: TextStyle(color: Colors.grey[200], fontSize: 10))
                  )
                )
              ]    
            )
          );
        }
      )
    );
  }
}