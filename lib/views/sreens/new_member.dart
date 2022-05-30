import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/views/widgets/text_input_field.dart';

class New_Member extends StatefulWidget {
  const New_Member({ Key? key }) : super(key: key);

  @override
  State<New_Member> createState() => _New_MemberState();
}

class _New_MemberState extends State<New_Member> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _academicsController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:Padding(
        padding: EdgeInsets.only(left:20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              const SizedBox(height: 30),
              const Text(
                'New Posts',
                style:TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),

              StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('videos').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user_videos = snapshot.data!.docs;
                  List<userBubble> usersWidgets = [];
                  for (var user in user_videos) {
                    final username = user.get('username');
                    final caption = user.get('caption');
                    final imgurl = user.get('thumbnail');
                    final songname = user.get('songName');
                    final comments = user.get('commentCount');

                    final usersWidget =
                        userBubble(username: username, caption: caption, url: imgurl, 
                        songName: songname, commentsCount: comments);
                    usersWidgets.add(usersWidget);
                  }
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(15.0),
                      children: usersWidgets,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
            ]
          ),
      ),
    );
  }
}

class userBubble extends StatelessWidget {
  String username;
  String caption;
  String url;
  dynamic commentsCount;
  String songName;

  userBubble(
      {
      Key? key, 
      required this.username, 
      required this.caption,
      required this.commentsCount, 
      required this.url,
      required this.songName
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            elevation: 8,
            color: cardColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children:[ 
                  Text(username,
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueGrey[50],
                      backgroundImage: NetworkImage(url),
                    ),
                    Column(
                      children: [
                        Text('Video about: $caption',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        Text(
                            'Song Name: $songName',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Comments: $commentsCount',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        ));
  }
}
