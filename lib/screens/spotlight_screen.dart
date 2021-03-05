import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/widgets/spotlight_actions.dart';
import 'package:snapchat/widgets/spotlight_content_account.dart';
import 'package:snapchat/widgets/spotlight_content_hashtags.dart';
import 'package:snapchat/widgets/spotlight_content_views.dart';
import 'package:video_player/video_player.dart';

class SpotlightScreen extends StatefulWidget {
  @override
  _SpotlightScreenState createState() => _SpotlightScreenState();
}

class _SpotlightScreenState extends State<SpotlightScreen> {

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/spotlight-video.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.value.volume == 0 
        ? _controller.setVolume(1) 
        : _controller.setVolume(0);
      },
      onLongPressStart: (details) {
        setState(() {
          _controller.pause();
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          _controller.play();
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
          ),
          child: Stack(
            children: [
              VideoPlayer(_controller),
              Positioned(
                top: 50,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                backgroundImage: AssetImage("assets/avatar.jpg"),
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: FaIcon(FontAwesomeIcons.search,color: Colors.white, size: 20)
                              )
                            ]
                          )
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('Spotlight',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20))
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                        )
                      )
                    ]
                  )
                )
              ),
              Positioned(
                right: MediaQuery.of(context).size.width/40,
                child: SpotlightActions()
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/40 * 31,
                child: SpotlightContentViews()
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/40 * 32,
                child: SpotlightContentAccount()
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/40 * 34,
                child: SpotlightContentHashtags()
              )
            ]
          )
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}