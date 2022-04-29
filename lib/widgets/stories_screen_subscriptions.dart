import 'package:flutter/material.dart';

class StoriesScreenSubscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
        itemCount: 6,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {

          String subName = (index % 3 == 0) ? "Mbappe Still The Best French Player" : "The Reason She Won't Return For Bate Is So Sad";
          String subDate = (index % 3 == 0) ? "Today" : "2h ago";
          String subImg = (index % 3 == 0) ? "assets/subscriptions-1.jpg" : "assets/subscriptions-2.jpg";
    
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.darken),
                  fit: BoxFit.fill,
                  image: AssetImage(subImg)
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(subName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                      )
                  ),
                  Positioned(
                    bottom: 8,
                    left: 5,
                    child: Text(subDate,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                  )
                ]
              )
            )
          );
        }
      )
    );
  }
}