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

  static updateEvent(EventModel model) {
    var collection = createEventsCollection();

    collection.doc(model.id).update(model.toJson());
  }

  static Stream<QuerySnapshot<EventModel>> getEvents(String id) {
    var collection = createEventsCollection();
    if (id == "all") {
      return collection.snapshots();
    }
    return collection.where("category", isEqualTo: id).snapshots();
  }
}
