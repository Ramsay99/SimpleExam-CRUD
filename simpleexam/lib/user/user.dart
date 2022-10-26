import 'package:cloud_firestore/cloud_firestore.dart';

const String firebaseCollectionName = 'users';
final CollectionReference<Map<String, dynamic>> usersCollection =
    FirebaseFirestore.instance.collection(firebaseCollectionName);
const String firebaseUserID = 'id';
const String firebaseUserName = 'name';
const String firebaseUserAge = 'age';
const String firebaseUserAccCreated = 'accCreated';

class User {
  final String id;
  final String name;
  final int age;
  final DateTime accCreated;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.accCreated,
  });

  static Stream<List<User>> getUsers() {
    return FirebaseFirestore.instance
        .collection(firebaseCollectionName)
        .orderBy('accCreated', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      firebaseUserID: id,
      firebaseUserName: name,
      firebaseUserAge: age,
      firebaseUserAccCreated: accCreated,
    };
  }

  static User fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData[firebaseUserID],
      name: jsonData[firebaseUserName] ?? "NOT_Available",
      age: jsonData[firebaseUserAge] ?? -1,
      accCreated: ((jsonData[firebaseUserAccCreated] as Timestamp) == null
          ? DateTime(1)
          : (jsonData[firebaseUserAccCreated] as Timestamp).toDate()),
    );
  }

  DocumentReference<Map<String, dynamic>> getID() {
    return usersCollection.doc(id);
  }

  void setName(String name) {
    getID().update({firebaseUserName: name});
  }

  void setAge(int age) {
    getID().update({firebaseUserName: name});
  }

  String getAccCreated() {
    return accCreated.toIso8601String();
  }
}
