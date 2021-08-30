// @dart=2.9
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';

const apikey="a2f08e03bf6f442b27e05cb247e0b43e4b2e05d26b31db185329b7959f056f9200ad5dd5d6b6497a";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectCount = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
            children: [
              CameraDeepAr(
                  onCameraReady: (isReady) {
                    setState(() {});
                  },
                  onImageCaptured: (path) {
                    setState(() {});
                  },
                  onVideoRecorded: (path) {
                    setState(() {});
                  },
                  androidLicenceKey: apikey,
                  iosLicenceKey: apikey,
                  cameraDeepArCallback: (c) async {
                    cameraDeepArController = c;
                    setState(() {});
                  }),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.camera),
                          onPressed: () => {
                            cameraDeepArController.changeMask(effectCount),
                            if (effectCount == 7) {effectCount = 0},
                            effectCount++
                          })))
            ],
          )),
    );
  }
}