import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children:[
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Zim Talents',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ]
      )
    );
  }
}