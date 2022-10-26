import 'package:flutter/material.dart';
import 'package:simpleexam/shared/functions/shared_string_functions.dart';

import '../user/user.dart';

class EditUser {
  static late User _editedUser;
  static void setEditedUser(User user) {
    _editedUser = user;
  }

  static Future<dynamic> dialogEditUser(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(_editedUser.name),
        content: const Text(
            "Set a Random Name for the selected user, by clicking on the Button below."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setEditedUser(_editedUser);
              _editedUser.setName(generateString(firstLetterBeCapital: true));
            },
            child: const Text("Set Random Name"),
          )
        ],
      ),
    );
  }
}
