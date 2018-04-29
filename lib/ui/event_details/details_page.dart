import 'package:app_bde/models/event.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EventDetailsPage extends StatefulWidget {
  
  final Event event;
  final Object imageTag;

  EventDetailsPage(
    this.event, {
      @required this.imageTag
    }
  );

  @override
  _EventDetailsPageState createState() => new _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          // TODO
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: []
          )
        )
      )
    );
  }
}
