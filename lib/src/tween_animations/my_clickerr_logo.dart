import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2),(){
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      title: Text("Animate Container"),
    ),
      body: Center(
        child: TweenAnimationBuilder(
         duration: const Duration(seconds: 1),
          tween:  Tween<double>(begin: w, end: 100),
          child: Image.asset("images/app_icon.png",
          fit: BoxFit.fill,
          ),
          builder: (context, value, child) {
            return Container(
              height: value,
              width: value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
