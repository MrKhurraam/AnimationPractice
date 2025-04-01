

import 'package:flutter/material.dart';
import 'package:flutter_animations/src/animaetd_ui_screens/red_sparrow_details.dart';

class HeadingScreen extends StatefulWidget {
  const HeadingScreen({super.key});

  @override
  State<HeadingScreen> createState() => _HeadingScreenState();
}

class _HeadingScreenState extends State<HeadingScreen> {
  bool pressed = false;
  Duration duration=Duration(milliseconds:240);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double left = w*0.17;
    double top =h*0.2;
  Color color =  pressed?Colors.white: Colors.black;
  print("pressed: $pressed");
  print("h: ${h*0.3}");

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            AnimatedPositioned(
              top:pressed?0: h*0.21,
              left: pressed? 0: left,
              bottom: pressed?0:w*0.56,
              right:  pressed?0:left,
              duration: Duration(milliseconds: 220),
              child:Hero(
                tag:  "image",
                child: Image.asset("images/red.jpg",
                height: h,width: w,fit: BoxFit.fill,
                ),
              ),
            ),
            AnimatedPositioned(
              top:pressed? h*0.07: h*0.12,
                left: pressed? w*0.55: left,
                duration: duration,
                child:  AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,
                      letterSpacing: 0.7,  color: color
                  ),
                  duration: duration,
                  child: Text("In theaters",
                  ),
                ),
            ),
            AnimatedPositioned(
              top:pressed? h*0.07:h*0.06,
              left: w*0.06,
              duration:duration,
              child:

              InkWell(
                onTap: (){
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                child: AnimatedContainer(
                  // color: color,
                  duration: duration,
                  child: Image.asset("images/dots.png",height: 20,width: 20,
                  color: color,
                  ),
                ),
              ),
            ),



            AnimatedPositioned(
              bottom: pressed?h*0.24:h*0.177,
              right: pressed?w*0.8:left,
              duration:duration,
              child:
              GestureDetector(
                onTap: () {
    setState(() {
            pressed = !pressed;
          });
                },
                child:Icon(Icons.edit_note_sharp,size: 32,color: color,)
              ),
          ),

            AnimatedPositioned(
              bottom:pressed?h*0.18:h*0.18,
              left: pressed? w*0.12: left,
              duration: duration,
              child:
              AnimatedDefaultTextStyle(
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: color
                ),
                duration: duration,
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                      _createRoute(RedSparrowDetails()));
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return RedSparrowDetails();
                      //     },));
                    },

                    child: Hero(
                        tag: "Red Sparrow",
                        child: Text("Red Sparrow"))),
              ),


            ),
            AnimatedPositioned(
              bottom:pressed?h*0.14:h*0.14,
              left: pressed? w*0.12: left,
              duration: duration,
              child:
              AnimatedDefaultTextStyle(
                style: TextStyle(fontSize: 15.5,fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,  color: color
                ),
                duration: duration,
                child: Hero(
                    tag:"Drama | 2h 20m" ,

                    child: Text("Drama | 2h 20m")),
              ),


            ),

            AnimatedPositioned(
              bottom:pressed?h*0.09:h*0.09,
              left: pressed? w*0.12: left,
              duration: duration,
              child:
              AnimatedDefaultTextStyle(
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,  color: color),

                duration: duration,
                child:  Text("IMDB 6.6/10",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Route _createRoute(page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}