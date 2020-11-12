import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child:
              Padding(padding: EdgeInsets.only(top: _val * 24), child: child),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 36,
          color: Colors.blueGrey[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
