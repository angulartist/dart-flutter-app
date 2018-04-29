import 'package:app_bde/models/event.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EventDetailsHeader extends StatefulWidget {
  
  final Event event;
  final Object imageTag;

  EventDetailsHeader(
    this.event, {
      @required this.imageTag
    }
  );

  @override
  _EventDetailsHeaderState createState() => new _EventDetailsHeaderState();
}

class _EventDetailsHeaderState extends State<EventDetailsHeader> {
  
  @override
  Widget build(BuildContext context) {

  }
}
