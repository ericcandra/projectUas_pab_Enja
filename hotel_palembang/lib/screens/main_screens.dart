import 'package:flutter/material.dart';
import 'package:hotel_palembang/screens/favorite_screens.dart';
import 'package:hotel_palembang/screens/home_screens.dart';
import 'package:hotel_palembang/screens/login_screens.dart';
import 'package:hotel_palembang/screens/profile_screens.dart';
import 'package:hotel_palembang/screens/search_screens.dart';
import 'package:hotel_palembang/screens/rating_screen.dart';
import 'package:hotel_palembang/screens/contact_screen.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screenOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    LoginScreen(),
    RatingScreen(),
    ContactScreen(),

    
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          // item pertama
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          // item kedua
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          // item ketiga
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
          // item keempat
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          // item kelima
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Rating'),
          // item keenam
          BottomNavigationBarItem(icon: Icon(Icons.contact_page),label: 'Contact'), 

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 245, 103, 169),
        unselectedItemColor: const Color.fromARGB(255, 239, 124, 195),
      ),
    );
  }
}
