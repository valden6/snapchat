import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotlightContentHashtags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 90),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text("#share", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold))
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text("#japan", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold))
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text("#music", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold))
            )
          ]
        )
      )
    );
  }
}