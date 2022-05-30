import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget {
  final String label;

  AppBarWidget(
    { Key? key,
    required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text( label),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}