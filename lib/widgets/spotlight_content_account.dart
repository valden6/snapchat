import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotlightContentAccount extends StatefulWidget {
  @override
  _SpotlightContentAccountState createState() => _SpotlightContentAccountState();
}

class _SpotlightContentAccountState extends State<SpotlightContentAccount> {
  
  FaIcon _saveIcon = FaIcon(FontAwesomeIcons.bookmark,color: Colors.white,size: 12);
  FaIcon _savedIcon = FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 10);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left:20)),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/spotlight-account-icon.jpg')
          ),
          Padding(padding: EdgeInsets.only(left:10)),
          Container(
            child: Row(
              children: [
                Text("@tankensurujapan", style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(left:10)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if(_savedIcon.icon == FontAwesomeIcons.plus){
                        _saveIcon = FaIcon(FontAwesomeIcons.solidBookmark,color: Colors.white,size: 12);
                        _savedIcon = FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 10);
                      }else{
                        _saveIcon = FaIcon(FontAwesomeIcons.bookmark,color: Colors.white,size: 12);
                        _savedIcon = FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 10);
                      }
                    });
                  },
                  child: Row(
                    children: [
                      _saveIcon,
                      Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
                      _savedIcon
                    ]
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}