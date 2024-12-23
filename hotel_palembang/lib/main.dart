import 'package:flutter/material.dart';
import 'package:hotel_palembang/screens/login_screens.dart';
import 'package:hotel_palembang/screens/main_screens.dart';
import 'package:hotel_palembang/screens/rating_screen.dart';
import 'package:hotel_palembang/screens/contact_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MainApp(isLoggedIn: isLoggedIn,));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: isLoggedIn ? const MainScreen() : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen(),
        '/rating': (context) => const RatingScreen(),
        '/contact': (context) => const ContactScreen()

      },
    );
  }
}
