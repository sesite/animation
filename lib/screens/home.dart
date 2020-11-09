import 'package:animation/shared/screenTitle.dart';
import 'package:animation/shared/tripList.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 180,
              child: ScreenTitle(
                text: 'Путешествия \n                 по миру!',
              ),
            ),
            Flexible(
              child: TripList(),
            ),
          ],
        ),
      ),
    );
  }
}
