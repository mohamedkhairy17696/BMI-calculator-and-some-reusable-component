import 'package:flutter/material.dart';
import 'package:new_project/models/user_model.dart';



class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<UserData> users = [
      UserData(1, "Mohamed Khairy", "+01060554578105"),
      UserData(2, "Ahmed Khairy", "+0107474488484"),
      UserData(3, "Mostafa Khairy", "+0157745747475683"),
      UserData(4, "Mohamed Khairy", "+01065640578105"),
      UserData(5, "Ahmed Khairy", "+0107476574488484"),
      UserData(6, "Mostafa Khairy", "+015746447475683"),
      UserData(7, "Mohamed Khairy", "+0106570578105"),
      UserData(8, "Ahmed Khairy", "+010747764488484"),
      UserData(9, "Mostafa Khairy", "+01574757475683"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Data"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildDataItem(users[index]),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 1,
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildDataItem(UserData user) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            child: Text(
              "${user.id}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${user.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "${user.phoneNumber}",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
