import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isRed = false;

  AnimationController _animcontrolhearth;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curve;

  @override
  void initState() {
    super.initState();
    _animcontrolhearth = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _curve = CurvedAnimation(curve: Curves.ease, parent: _animcontrolhearth);

    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_curve);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 30,
        ),
      ],
    ).animate(_curve);

    _animcontrolhearth.addListener(() {});

    _animcontrolhearth.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isRed = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isRed = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animcontrolhearth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isRed ? _animcontrolhearth.reverse() : _animcontrolhearth.forward();
          },
        );
      },
      animation: _animcontrolhearth,
    );
  }
}
