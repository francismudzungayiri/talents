import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/views/sreens/admin_members.dart';
import 'package:talents/views/sreens/dashboard_screen.dart';
import 'package:talents/views/sreens/new_member.dart';
import 'package:talents/views/sreens/video_screen.dart';
import 'package:talents/views/widgets/adminAppBar.dart';


class AdmnHome extends StatefulWidget {
  const AdmnHome({ Key? key }) : super(key: key);

  @override
  State<AdmnHome> createState() => _AdmnHomeState();
}

class _AdmnHomeState extends State<AdmnHome> {
  int _selectedIndex = 0;
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w600, color: Colors.red);
   final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    New_Member(),
    ViewMembers(),
    const Center(
      child: CircularProgressIndicator(),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void getUsersStreams()async{
    await for(var snapshot in firestore.collection('users').snapshots()){
      for(var user in snapshot.docs){
        print(user.data());
      }
    }    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor:appBarColor,
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex), 
        ),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: activeCardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video),
            label: 'videos',
            backgroundColor: activeCardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
            backgroundColor: activeCardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Payments',
            backgroundColor: activeCardColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: buttonColor,
        unselectedItemColor: backgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}