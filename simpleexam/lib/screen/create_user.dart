import 'dart:math';
import 'package:flutter/material.dart';
import '../user/user.dart';

// ToDo: better UI, the YT UI part starts at 6:20
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
    final docUser = usersCollection.doc();

    final User user = User(
      id: docUser.id,
      name: name,
      age: age <= -1 ? Random().nextInt(99 - 18) + 18 : age,
      accCreated: DateTime.now(),
    );

    final userJson = user.toJson();

    // create Document and write data in firebase
    // [.set] Sets data on the document, overwriting any existing data. If the document does not yet exist, it will be created.
    // [.update] Updates data on the document. Data will be merged with any existing document data. If no document exists yet, the update will fail.
    await docUser.set(userJson);
  }
}
