import 'package:flutter/material.dart';
import 'package:praktinis_3/Screens/Logged_In/add_new.dart';
import 'package:praktinis_3/Screens/Logged_In/home.dart';
import 'package:praktinis_3/Screens/Logged_In/user_adverts.dart';

class HomePageNavigator extends StatefulWidget {
  @override
  _HomePageNavigatorState createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {

  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    HomePage(),
    AddNewAdvert(),
    UserAdverts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'New Advert',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              label: 'My Adverts',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[200],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

