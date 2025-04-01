import 'package:flutter/material.dart';
import 'package:flutter_animations/src/tween_animations/animated_icon_size_up_down.dart';
import 'package:flutter_animations/src/tween_animations/animted_icons_screen.dart';

import 'animaetd_ui_screens/heading_screen.dart';
import 'animated_containers/animated_container_screen.dart';
import 'epub_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Animations",
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return AnimatedContainerTestScreen();
                },));
          }, child: Text("Container")),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return HeadingScreen();
                },));
          }, child: Text("Start")),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return AnimatedIconScreen();
                },));
          }, child: Text("AnimatedIconScreen")),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return AnimatedIconSizeScreen();
                },));
          }, child: Text("AnimatedIconSizeColor")),
          // ElevatedButton(onPressed: (){
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) {
          //         // return EpubDoc();
          //       },));
          // }, child: Text("Epub")),
        ],
      ),
    ),);
  }
}

