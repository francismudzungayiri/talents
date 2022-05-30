import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;

  User(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePhoto});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}

class BeneficiaryUser{

  String profilePhoto;
  String fullname;
  String email;
  String username;
  String occupation;
  String location;
  String problem;
  String academics;
  String dob;
  String gender;
  String bio;
  String uid;

  BeneficiaryUser(
      {
        required this.profilePhoto,
        required this.fullname,
        required this.email,
        required this.username,
        required this.occupation,
        required this.location,
        required this.problem,
        required this.academics,
        required this.dob,
        required this.gender,
        required this.bio,
        required this.uid,
      });

  Map<String, dynamic> toJson() => {
        "name": fullname,
        "profilePhoto": profilePhoto,
        "email": email,
        "usename":username,
        "occupation": occupation,
        "location": location,
        "problem": problem,
        "academics": academics,
        "date of birth": dob,
        "gender": gender,
        "bio": bio,
        "uid": uid,
      };

    static BeneficiaryUser fromSnap(DocumentSnapshot snap) {
      var snapshot = snap.data() as Map<String, dynamic>;
      return BeneficiaryUser(
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        fullname: snapshot['fullname'],
        occupation: snapshot['ocupation'],
        location: snapshot['location'],
        problem: snapshot['problem'],
        academics: snapshot['academics'],
        dob: snapshot['dob'],
        gender: snapshot['gender'],
        bio: snapshot['bio'],
      );
    }
}

class Admin {
  String name = 'Simba';
  String email = 'simba@gmail.com';
  String uid = 'admin1';
}