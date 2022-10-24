import 'package:flutter/material.dart';
import 'package:simpleexam/screen/create_user.dart';

import '../user/user.dart';

class CRUDHome extends StatelessWidget {
  const CRUDHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home_rounded),
            Text("CRUD"),
          ],
        ),
      ),
      // ToDo: Write a method to Get a single user, YT: 11:17
      body: StreamBuilder(
        stream: User.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something has Error, ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
                children: users.map(User.displayUsers_ListView).toList());
          } else {
            return const Center(
              child: Text("Error, in StreamBuilding Users Data as ListView!"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateUser()));
        },
      ),
    );
  }
}
