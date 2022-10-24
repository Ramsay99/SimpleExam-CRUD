// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const String firebaseCollectionName = 'users';
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
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  static Widget displayUsers_ListView(User user) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(child: Text('${user.age}')),
      title: Text(user.name),
      subtitle: Text("${user.accCreated.toIso8601String()}\n${user.id}"),
    );
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
}
