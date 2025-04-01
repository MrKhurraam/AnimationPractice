
import 'package:flutter/material.dart';

class RedSparrowDetails extends StatelessWidget {
  const RedSparrowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
        Positioned(
          left: 20,top: 40,
          child:Image.asset("images/dots.png",height: 25,width: 25,

        ),),

          Positioned(
              top: 95,
              left: 20,
              bottom: 0,right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Hero(tag:  "image", child: Image.asset("images/red.jpg",
                    height: h*0.3,width: w*0.4,fit: BoxFit.fill,
                  ),),
SizedBox(width: 15,),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,
                            letterSpacing: 0.7,
                            color: Colors.black
                        ),
                        duration: Duration(milliseconds: 50),
                        child: Text("Red Sparrow"),
                      ),SizedBox(height: 12,),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(fontSize: 15.5,fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,  color: Colors.black
                        ),
                        duration: Duration(milliseconds: 50),
                        child: Text("Drama | 2h 20m"),
                      ),SizedBox(height: 22,),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,  color: Colors.black),

                        duration: Duration(milliseconds: 50),
                        child:  Text("IMDB 6.6/10",
                        ),
                      ),
                    ],
                  )
                ],
              )

            ],
          ))
      ],
      ),
    );
  }
}
