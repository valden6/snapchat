import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreviewScreen extends StatefulWidget{
  
  final String imgPath;

  PreviewScreen({this.imgPath});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();

}
class _PreviewScreenState extends State<PreviewScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            ),
            child: Stack(
              children: [
                Image.file(File(widget.imgPath),fit: BoxFit.cover),
                Positioned(
                  top:50,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: FaIcon(FontAwesomeIcons.times,color: Colors.white,size: 27,)
                  ),
                )
              ]
            )
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: FaIcon(FontAwesomeIcons.save,color:Colors.white))
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          Container(
                            width: 60,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: FaIcon(FontAwesomeIcons.shareSquare,color:Colors.white))
                          )
                        ]
                      )
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: FittedBox()
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Send To", style: TextStyle(fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          FaIcon(FontAwesomeIcons.play,size: 15)
                        ]
                      )
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }

  Future<ByteData> getBytesFromFile() async{
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}