import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/animations/slide_top_transition.dart';
import 'package:snapchat/screens/preview_screen.dart';
import 'package:snapchat/screens/setting_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State {

  CameraController controller;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {

      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if(cameras == null || cameras.length == 0){
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
          ),
          child: Stack(
            children: [
              Center(
                child: Text("No camera available !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
              ),
              Positioned(
                bottom: 10,
                right: MediaQuery.of(context).size.width/2 - 25,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                  }
                )
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                top: 60,
                left: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(context, SlideRightRoute(page: SettingScreen())),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/avatar.jpg"),
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: FaIcon(FontAwesomeIcons.search,color: Colors.white, size: 20)
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
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon( Icons.person_add,color: Colors.white)
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: FaIcon(FontAwesomeIcons.solidCommentAlt,color: Colors.white, size: 20)
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
        ),
        child: Stack(
          children: [
            _cameraPreviewWidget(),
            Positioned(
              bottom: 10,
              right: MediaQuery.of(context).size.width/2 - 25,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  _onCapturePressed(context);
                }
              )
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 60,
              left: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("assets/avatar.jpg"),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: FaIcon(FontAwesomeIcons.search,color: Colors.white, size: 20)
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
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon( Icons.person_add,color: Colors.white)
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: FaIcon(FontAwesomeIcons.solidCommentAlt,color: Colors.white, size: 20)
                          )
                        ]
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text('Loading',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w900));
    }
    return GestureDetector(
      onDoubleTap: _onSwitchCamera,
      child: CameraPreview(controller)
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error:${e.code}\nError message : ${e.description}';
    print(errorText);
  }

  void _onCapturePressed(context) async {
    try {
      final image = await controller.takePicture();
      Navigator.push(context,MaterialPageRoute(builder: (context) => PreviewScreen(imgPath: image.path)));
    } catch (e) {
      _showCameraException(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }
}