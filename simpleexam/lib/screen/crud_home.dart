import 'package:flutter/material.dart';
import 'package:simpleexam/screen/edit_user.dart';
import '../user/user.dart';

Row _homeTitle = Row(
  children: const [
    Icon(Icons.home_rounded),
    Padding(padding: EdgeInsets.only(right: 10)),
    Text("CRUD"),
  ],
);
const Padding _clickOnToEditDelUserText = Padding(
  padding: EdgeInsets.symmetric(vertical: 4),
  child: Text(
    "Click on any User to Edit/Delete",
    style: TextStyle(fontSize: 20),
  ),
);
var _coloredBox = const Divider(
  color: Colors.black,
  thickness: 2,
  height: 0,
);

class CRUDHome extends StatefulWidget {
  const CRUDHome({super.key});

  @override
  State<CRUDHome> createState() => _CRUDHomeState();
}

class _CRUDHomeState extends State<CRUDHome> {
  late User tappedUser;
  late AsyncSnapshot<List<User>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _homeTitle,
      ),
      // ToDo: Write a method to Get a single user, YT: 11:17
      body: StreamBuilder(
        stream: User.getUsers(),
        builder: (context, builderSnapShot) {
          snapshot = builderSnapShot;
          if (snapshot.hasData) {
            return Column(
              children: [
                _clickOnToEditDelUserText,
                _coloredBox,
                displayUsersInListTile(),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error!,\n ${snapshot.error}'),
            );
          } else {
            return loadingStreamBuilding();
          }
        },
      ),
      floatingActionButton: createUserFloatingBtn(context),
    );
  }

  Widget displayUsersInListTile() {
    final List<User> users = snapshot.data!;
    return Expanded(
      child: ListView(
        children: users.map(usersInListTile).toList(),
      ),
    );
  }

  Widget usersInListTile(User user) {
    setTappedUser(user);
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(child: Text('${tappedUser.age}')),
      title: Text(tappedUser.name),
      subtitle: Text("${user.accCreated.toIso8601String()}\n${user.id}"),
      onTap: () {
        setTappedUser(user);
        showEditDialog();
      },
    );
  }

  void setTappedUser(User user) {
    tappedUser = user;
  }

  void showEditDialog() {
    setEditUser();
    _showEditDialog();
  }

  void setEditUser() {
    EditUser.setEditedUser(tappedUser);
  }

  _showEditDialog() {
    EditUser.dialogEditUser(context);
  }

  Center loadingStreamBuilding() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          Text("Loading StreamBuilding Users Data as ListView!"),
        ],
      ),
    );
  }

  FloatingActionButton createUserFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
        size: 40,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(
          '/createuser',
        );
      },
    );
  }
}
