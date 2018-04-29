import 'package:app_bde/ui/event_list.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(new PartyApp());
}

class PartyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
        fontFamily: 'Roboto'
      ),
      home: new EventList(),
    );
  }
}