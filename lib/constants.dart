import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/views/sreens/add_video_screen.dart';
import 'package:talents/views/sreens/profile_screen.dart';
import 'package:talents/views/sreens/search_screen.dart';
import 'package:talents/views/sreens/video_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  ProfileScreen(uid: authController.user.uid),
];

// common colors
const backgroundColor = Color(0xFFE6DDC6);
const buttonColor = Color(0xFF00ADB5);
const borderColor = Color(0xFFEEEEEE);
const activeCardColor = Color(0xFFA19882);
const iconColor = Color(0xFFA19882);
const appBarColor = Color(0xFFA19882);
const cardColor = Color(0xFFC2B8A3);
const textColor = Color(0xFF9D9D9D);

// Firebase constants
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

// counting number of docs in firebase
