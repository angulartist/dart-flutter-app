import 'dart:convert';
import 'package:app_bde/models/event.dart';

class EventApi {
  static List<Event> allEventsFromJson(String jsonData) {
    List<Event> events = [];
    json.decode(jsonData)['events'].forEach((event) => events.add(_fromMap(event)));
    return events;
  }

  static Event _fromMap(Map<String, dynamic> map) {
    return new Event(
      externalId: map['id'],
      title: map['title'],
      details: map['details'],
      location: map['location'],
      bannerUrl: map['banner_url'],
      likeCounter: map['like_counter'],
      isFree: map['is_free'],
      pictures: new List<String>.from(map['pictures']),
      attributes: new List<String>.from(map['attributes'])
    );
  }
}