
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({super.key});

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
 late  final Animation _colorAnimation;
  late  final Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);
    _sizeAnimation = Tween<double>(begin: 30, end: 90)
        .animate(_animationController);

    _animationController.addListener(() {
      if (kDebugMode) {
        // print("_animationController value: ${_animationController.value}");
        print("_colorAnimation value: ${_colorAnimation.value}");
      }
    });

    _animationController.addStatusListener((status) {
      print("_animationController status: ${status}");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) =>
           Container(
            child: IconButton(
              onPressed: (){
                _animationController.isCompleted?
                _animationController.reverse():_animationController.forward();

                print("status: ${_animationController.status}");
              },
              icon: Icon(Icons.heart_broken_sharp,
              size: _sizeAnimation.value,
              color: _colorAnimation.value ),
            ),
          ),
        ),
      ),
    );
  }
}
