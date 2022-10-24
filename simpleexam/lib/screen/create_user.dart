import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../user/user.dart';

// ToDo: better UI, start at 6:20 
class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: textFieldController),
        actions: [
          IconButton(
              onPressed: () {
                final name = textFieldController.text;
                createUser(name: name);
                textFieldController.clear();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Center(
        child: Text("Hi, Create User Here!"),
      ),
    );
  }

  Future createUser({required String name, int age = -1}) async {
    // Reference to document in firestore
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final User user = User(
      id: docUser.id,
      name: name,
      age: age <= -1 ? Random().nextInt(99 - 18) + 18 : age,
      accCreated: DateTime.now(),
    );

    final userJson = user.toJson();

    // create Document and write data in firebase
    await docUser.set(userJson);
  }
}
