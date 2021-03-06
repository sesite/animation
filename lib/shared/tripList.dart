import 'package:animation/models/Trip.dart';
import 'package:animation/screens/detail.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  TripList({Key key}) : super(key: key);

  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrip();
    });
  }

  void _addTrip() {
    List<Trip> _trips = [
      Trip(
          title: 'Остров Пхукет', price: '1200', night: '3', img: 'phuket.jpg'),
      Trip(
          title: 'Турция All-inclusive 5+',
          price: '1800',
          night: '7',
          img: 'turkey.jpg'),
      Trip(
          title: 'Симиланский острова',
          price: '4100',
          night: '5',
          img: 'similan.jpg'),
      Trip(
          title: 'Остров Сокровищ',
          price: '9990',
          night: '5',
          img: 'treasure.jpg'),
    ];

    _trips.forEach((Trip trip) {
      _tripTiles.add(_buildTitle(trip));
      _listKey.currentState.insertItem(_tripTiles.length - 1);
    });
  }

  Widget _buildTitle(Trip trip) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Details(trip: trip)));
        },
        contentPadding: EdgeInsets.all(20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${trip.night} ночей',
              style: TextStyle(fontSize: 16, color: Colors.blue[700]),
            ),
            Text(
              '${trip.title}',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ],
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Hero(
            tag: 'location-img-${trip.img}',
            child: Image.asset(
              'assets/${trip.img}',
              height: 50,
            ),
          ),
        ),
        trailing: Text(
          '\$ ${trip.price}',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
            position: animation.drive(_offset), child: _tripTiles[index]);
      },
    );
  }
}
