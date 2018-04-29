import 'package:meta/meta.dart';

class Event {
  final int externalId;
  final String title;
  final String details;
  final String imageUrl;
  final String location;
  final int likeCounter;
  final bool isFree;
  final List<String> pictures;
  final List<String> attributes;

  Event({
    @required this.externalId,
    @required this.title,
    @required this.details,
    @required this.imageUrl,
    @required this.location,
    @required this.likeCounter,
    @required this.isFree,
    @required this.pictures,
    @required this.attributes,
  });

  @override
  String toString() {
    return "Event $externalId is $title";
  }
}