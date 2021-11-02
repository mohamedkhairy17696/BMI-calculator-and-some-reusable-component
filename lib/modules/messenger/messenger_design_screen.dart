import 'package:flutter/material.dart';

class MessengerDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/82667987?v=4",
              ),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Chats",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(
                height: 20
              ),
              Container(
                height: 106,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15,
                  ),
                  itemCount: 12,
                ),
              ),
              SizedBox(height: 25),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() {
    return Container(
      width: 64,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/82667987?v=4",
                ),
                backgroundColor: Colors.white,
              ),
              Container(
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Mohamed KHairy Farghal Mohamed",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildChatItem() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/82667987?v=4",
                      ),
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mohamed KHairy Farghal Mohamed Farghal Mackey",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hello, My Name is Mohamed KHairy Hello, My Name is Mohamed KHairy Hello, My Name is Mohamed KHairy",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    "02:30 PM",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
