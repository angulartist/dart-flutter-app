import 'dart:async';

import 'package:app_bde/models/event.dart';
import 'package:app_bde/services/api.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => new _EventListState();
}

class _EventListState extends State<EventList> {
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  _loadEvents() async {
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/events.json");
    setState(() {
      _events = EventApi.allEventsFromJson(fileData);
    });
  }

  Widget _buildEventItem(BuildContext context, int index) {
    Event event = _events[index];

    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              //onTap: //TODO
              leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(event.bannerUrl),
                ),
              ),
              title: new Text(
                event.title,
                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              subtitle: new Text(event.details),
              isThreeLine: true, // Less Cramped Tile
              dense: false, // Less Cramped Tile
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppTitleWidget() {
    return new Text(
      'Events',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
    );
  }

  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(
        8.0,  // A left margin of 8.0
        56.0, // A top margin of 56.0
        8.0,  // A right margin of 8.0
        0.0   // A bottom margin of 0.0
      ),
      child: new Column(
        // A column widget can have several
        // widgets that are placed in a top down fashion
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget()
        ],
      ),
    );
  }

  Future<Null> refresh() {
    _loadEvents();
    return new Future<Null>.value();
  }

  Widget _getListViewWidget() {
    return new Flexible(
      child: new RefreshIndicator(
        onRefresh: refresh,
        child: new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _events.length,
          itemBuilder: _buildEventItem
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _buildBody(),
    );
  }
}