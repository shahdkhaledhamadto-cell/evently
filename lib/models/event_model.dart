import 'package:evently/models/event_category.dart';

class EventModel {
  String id;
  final String title;
  final String description;
  final DateTime date;
  final EventCategory category;
  bool isFavorite;

  EventModel({
    this.id = "",
    required this.title,
    required this.date,
    required this.category,
    this.description = "",
    this.isFavorite = false,
  });

  static EventModel formJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isFavorite: json['isFavorite'],
      date: json['date'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isFavorite": isFavorite,
      "date": date,
      "category": category,
    };
  }

  String get day => date.day.toString().padLeft(2, "0");

  String get month => _monthNames[date.month - 1];

  static const List<String> _monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static final List<EventModel> dummyEvents = [
    EventModel(
      id: "1",
      title: "This is a Birthday Party",
      date: DateTime(2026, 1, 21),
      category: EventCategory.birthday,
      isFavorite: true,
    ),
    EventModel(
      id: "2",
      title: "Meeting for Updating The Development Method",
      date: DateTime(2026, 1, 22),
      category: EventCategory.meeting,
    ),
    EventModel(
      id: "3",
      title: "Discover unique exhibitions and talents",
      date: DateTime(2026, 1, 23),
      category: EventCategory.exhibition,
    ),
    EventModel(
      id: "4",
      title: "Weekend cycling race with friends",
      date: DateTime(2026, 1, 24),
      category: EventCategory.sport,
      isFavorite: true,
    ),
    EventModel(
      id: "5",
      title: "Monthly book club discussion",
      date: DateTime(2026, 1, 25),
      category: EventCategory.bookClub,
    ),
  ];
}
