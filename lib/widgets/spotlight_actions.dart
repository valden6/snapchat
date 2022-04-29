import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotlightActions extends StatefulWidget {
  @override
  _SpotlightActionsState createState() => _SpotlightActionsState();
}

class _SpotlightActionsState extends State<SpotlightActions> {

  FaIcon _likeButton = FaIcon(FontAwesomeIcons.solidHeart, color: Colors.white, size: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40 * 3),
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_likeButton.color == Colors.white){
                          _likeButton = FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red, size: 20);
                        }else{
                          _likeButton = FaIcon(FontAwesomeIcons.solidHeart, color: Colors.white, size: 20);
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: _likeButton,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:20)),
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: FaIcon(FontAwesomeIcons.play, color: Colors.white, size: 15),
                  ),
                  Padding(padding: EdgeInsets.only(top:20)),
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: FaIcon(FontAwesomeIcons.ellipsis, color: Colors.white, size: 20),
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}