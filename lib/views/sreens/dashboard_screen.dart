import 'package:flutter/material.dart';
import 'package:talents/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Zim Talents',
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFFEF7DC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Column(
                    children: [
                      const Text(
                        'App users',
                        style: TextStyle(
                          fontSize: 20,
                          color: backgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Icon(
                        Icons.person,
                        color: iconColor,
                        size: 40,
                      ),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFFFEF7DC),
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                    children: [
                      const Text(
                        'Streams',
                        style: TextStyle(
                          fontSize: 20,
                          color: backgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Icon(
                        Icons.music_video,
                        color: iconColor,
                        size: 40,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFFEF7DC),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                    children: [
                      const Text(
                        'App Donations',
                        style: TextStyle(
                          fontSize: 20,
                          color: backgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Icon(
                        Icons.payments,
                        color: iconColor,
                        size: 40,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '0.00 USD',
                        style: TextStyle(
                          fontSize: 35,
                          color: buttonColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFFEF7DC),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                    children: [

                      const SizedBox(height: 15),
                      Icon(
                        Icons.person,
                        color: iconColor,
                        size: 90,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}
