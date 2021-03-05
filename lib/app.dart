import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/screens/camera_screen.dart';
import 'package:snapchat/screens/chat_screen.dart';
import 'package:snapchat/screens/map_screen.dart';
import 'package:snapchat/screens/spotlight_screen.dart';
import 'package:snapchat/screens/stories_sceen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: [
        MapScreen(),
        ChatScreen(),
        CameraScreen(),
        StoriesScreen(),
        SpotlightScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        fixedColor: Colors.white, 
        unselectedItemColor: Colors.white,
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Map",
            icon: _selectedIndex==0? FaIcon(FontAwesomeIcons.mapMarkerAlt, color: Colors.lightGreen):FaIcon(FontAwesomeIcons.mapMarkerAlt)
          ),
          BottomNavigationBarItem(
            label: "Chat",
            icon: _selectedIndex==1? FaIcon(FontAwesomeIcons.commentAlt, color: Colors.blue):FaIcon(FontAwesomeIcons.commentAlt)
          ),
          BottomNavigationBarItem(
            label: "Camera",
            icon: _selectedIndex==2? FaIcon(FontAwesomeIcons.camera, color: Colors.yellow):FaIcon(FontAwesomeIcons.camera)
          ),
          BottomNavigationBarItem(
            label: "Stories",
            icon: _selectedIndex==3? FaIcon(FontAwesomeIcons.userFriends, color: Colors.purple):FaIcon(FontAwesomeIcons.userFriends)
          ),
          BottomNavigationBarItem(
            label: "Spotlight",
            icon: _selectedIndex==4? FaIcon(FontAwesomeIcons.play, color: Colors.red):FaIcon(FontAwesomeIcons.play)
          )
        ]
      )
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

}