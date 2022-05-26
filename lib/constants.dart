import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/controllers/d_userController.dart';
import 'package:talents/views/sreens/add_video_screen.dart';
import 'package:talents/views/sreens/profile_screen.dart';
import 'package:talents/views/sreens/search_screen.dart';
import 'package:talents/views/sreens/video_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];

// common colors
const backgroundColor = Color(0xFF222831);
const buttonColor = Color(0xFF00ADB5);
const borderColor = Color(0xFFEEEEEE);

// Firebase constants
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
var donatorAuthController = DonatorAuthController.instance;
