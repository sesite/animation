import 'package:animation/models/Trip.dart';
import 'package:animation/shared/heart.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              child: Hero(
                tag: 'location-img-${trip.img}',
                child: Image.asset(
                  'assets/${trip.img}',
                  height: 360,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                trip.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
              subtitle: Text(
                '${trip.night} ночей за ${trip.price} баксов.',
                style: TextStyle(letterSpacing: 1),
              ),
              trailing: Heart(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  'Cy jdsk jdsk djs dsjkd skds djs dj skdjs dks djskd skjdk sjdsk jdkjs kdsjd sjds jdkjsdj sjdksj sdjkd jskj sdj'),
            )
          ],
        ),
      ),
    ));
  }
}
