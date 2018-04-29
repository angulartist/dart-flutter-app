import 'package:app_bde/models/event.dart';
import 'package:app_bde/ui/event_details/header/event_app_image.dart';
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

  static const APP_BG_IMAGE = 'images/app_header_bg.jpg';
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    
    var slicedBackground = new SlicedAppImage(
      new Image.asset(
        APP_BG_IMAGE,
        width: screenWidth,
        height: 280.00,
        fit: BoxFit.cover
      ),
      overlay: const Color(0x006064)
    );

    var banner = new Hero(
      tag: widget.imageTag,
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.event.imageUrl),
        radius: 75.0
      )
    );

    var favInfo = new Padding(
      padding: const EdgeInsets.only(top: 16.00),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            Icons.favorite,
            color: Colors.redAccent,
            size: 16.0
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              widget.event.likeCounter.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white)
            )
          )
        ],
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {
                //TODO
              },
              child: new Text('SUBSCRIBE'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.grey,
              textColor: Colors.white,
              onPressed: () async {
                //TODO
              },
              child: new Text('LIKE'),
            ),
          ),
        ],
      ),
    );

    return new Stack(
      children: [
        slicedBackground,
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: [
              banner,
              favInfo,
              actionButtons,
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.white),
        ),
      ],
    );
  }
}
