
import 'package:flutter/material.dart';
import 'package:flutter_animations/src/tween_animations/my_clickerr_logo.dart';

class AnimatedContainerTestScreen extends StatefulWidget {
  const AnimatedContainerTestScreen({super.key});

  @override
  State<AnimatedContainerTestScreen> createState() => _AnimatedContainerTestScreenState();
}

class _AnimatedContainerTestScreenState extends State<AnimatedContainerTestScreen> {

  // Animated container just animates the changing value
  // i.e if anything inside it changes, it will slightly show animation

  String text = "Khurram";
  Color color = Colors.orange;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animate Container"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          AnimatedContainer(
            color: color,
            duration: Duration(seconds: 2),
            child: Text("$text"),
          ),

          Spacer(),
          ElevatedButton(onPressed: (){
           Navigator.push(context,
               MaterialPageRoute(builder: (context) {
             return SplashScreen();
           },));
          }, child: Text("Apply Effect")),

        ],
      ),
    );
  }
}
