import 'dart:convert';
import 'package:hotel_palembang/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<User> userList = [];

Future<void> loadUsers() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? usersJson = prefs.getString('user_list');
  if (usersJson != null) {
    List<dynamic> decodedList = jsonDecode(usersJson);
    userList = decodedList.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
  }
}


// Fungsi untuk menyimpan data pengguna ke SharedPreferences
Future<void> saveUsers() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String usersJson = jsonEncode(userList.map((e) => e.toJson()).toList());
  await prefs.setString('user_list', usersJson);
}

// Fungsi untuk menambahkan pengguna baru
Future<void> addUser(User user) async {
  userList.add(user);
  await saveUsers();
}


