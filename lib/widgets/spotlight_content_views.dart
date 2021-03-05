import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotlightContentViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 70),
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.play,color: Colors.white,size: 10),
            Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
            Text("344k", style: TextStyle(fontSize: 14,color: Colors.white)),
          ],
        ),
      )
    );
  }
}