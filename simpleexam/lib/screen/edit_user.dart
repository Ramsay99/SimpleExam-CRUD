import 'package:flutter/material.dart';
import 'package:simpleexam/shared/functions/shared_string_functions.dart';

import '../user/user.dart';

class EditUser {
  static const String _contentText =
      "Set a Random Name for the selected user, by clicking on the Button below.";
  static late User _editedUser;
  static void setEditedUser(User user) {
    _editedUser = user;
  }

  static Future<dynamic> dialogEditUser(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(_editedUser.name),
        content: const Text(_contentText),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _editedUser.setName(generateString(firstLetterBeCapital: true));
            },
            child: const Text("Set Random Name"),
          ),
          TextButton(
            onPressed: () {
              _editedUser.delUser();
              Navigator.pop(context);
            },
            child: const Text(
              "Delete User",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
