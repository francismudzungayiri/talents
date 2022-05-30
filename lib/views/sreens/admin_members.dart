import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talents/constants.dart';

class ViewMembers extends StatelessWidget {
  const ViewMembers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Users',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800
            ),
          ),

          StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('users').snapshots(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                final users = snapshot.data!.docs;
                List <userBubble>usersWidgets = [];
                for(var user in users){
                  final username = user.get('name');
                  final email = user.get('email');
                  final imgurl = user.get('profilePhoto');
    
                  final usersWidget =userBubble(name: username, email: email, url: imgurl);
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
              
            }
            ),
        ],
      ),
    );
  }
}

class userBubble extends StatelessWidget {
  
  String name;
  String email;
  String url;

  userBubble(
    { Key? key,
      required this.name,
      required this.email,
      required this.url
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          elevation: 8,
          color: cardColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey[50],
                    backgroundImage: NetworkImage(url),
                  ),
                Column(
                    children: [
                      Text(name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      Text(email)
                    ],
                  ),
              ],
            ),
          ),
          ),
      )     
      );
  }
}