import 'package:flutter/material.dart';

class BookingsPage extends StatefulWidget {
  BookingsPage({Key key}) : super(key: key);

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          title: Text("Booking Type"),
          subtitle: Text("Booking Date"),
          trailing: Text("Booking Status"),
        ),
      ),
    );
  }
}
