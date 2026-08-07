import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';

class FirebaseFunctions {
  static CollectionReference<EventModel> createEventsCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snap, op) {
            return EventModel.formJson(snap.data()!);
          },
          toFirestore: (model, option) {
            return model.toJson();
          },
        );
  }

  static void addEvent(EventModel model) {
    var collection = createEventsCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }
}
