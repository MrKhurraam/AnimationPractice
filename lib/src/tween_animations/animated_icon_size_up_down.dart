
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedIconSizeScreen extends StatefulWidget {
  const AnimatedIconSizeScreen({super.key});

  @override
  State<AnimatedIconSizeScreen> createState() => _AnimatedIconSizeScreenState();
}

class _AnimatedIconSizeScreenState extends State<AnimatedIconSizeScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double?> _sizeAnimation;
  late final CurvedAnimation _curves;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this);

    _curves = CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    // here we are giving _curves instead of _animatedController because _curves is
    // child of _animatedController and we can access parent properties from its child,
    // so _animatedController will be auto assigned to _colorAnimation & _sizeAnimation.
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_curves);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween<double>(begin: 30, end: 60), weight: 50),
        TweenSequenceItem(tween: Tween<double>(begin: 60, end: 30), weight: 50),
      ]
    ).animate(_curves);

    _animationController.addListener(() {
      if (kDebugMode) {
        print("_colorAnimation value: ${_colorAnimation.value}");
      }
    });

    _animationController.addStatusListener((status) {
      if (kDebugMode) {
        print("_animationController status: $status");
      }

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
