import 'package:app_bde/models/event.dart';
import 'package:app_bde/ui/event_details/header/details_header.dart';
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

    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.lightGreen,
          Colors.greenAccent
        ]
      )
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new EventDetailsHeader(
                widget.event,
                imageTag: widget.imageTag
              )
            ]
          )
        )
      )
    );
  }
}
