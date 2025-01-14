import 'package:flutter/material.dart';
import 'package:hotel_palembang/screens/edit_profile_screens.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String? _savedImagePath;
  String? _selectedImage;
  String _name = 'Enja';
  String _email = 'enja@gmail.com';
  String _phone = '+62 812 1555 9999';

  final List<String> _localImages = [
    'images/icon.jpg',
    'images/profile.jpg',
    'images/anime.jpg',
    'images/th.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('user_name') ?? _name;
      _email = prefs.getString('user_email') ?? _email;
      _phone = prefs.getString('user_phone') ?? _phone;

      final imagePath = prefs.getString('profile_image_path');
      if (imagePath != null && imagePath.startsWith('images/')) {
        _selectedImage = imagePath;
      } else if (imagePath != null) {
        _savedImagePath = imagePath;
        _profileImage = File(imagePath);
      }
    });
  }

  Future<void> _saveProfileImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  void _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        _selectedImage = null;
      });
      await _saveProfileImage(pickedFile.path);
    }
  }

  void _pickImageFromLocal() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _localImages.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(_localImages[index], width: 50, height: 50),
              title: Text('Image ${index + 1}'),
              onTap: () async {
                setState(() {
                  _selectedImage = _localImages[index];
                  _profileImage = null;
                });
                await _saveProfileImage(_localImages[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : _selectedImage != null
                                  ? AssetImage(_selectedImage!) as ImageProvider
                                  : const AssetImage('images/profile.jpg'),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.folder),
                                        title: const Text('Choose from Local Images'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _pickImageFromLocal();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 24,
                              child: Icon(Icons.camera_alt, color: Colors.blue, size: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _name,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _email,
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _phone,
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final updatedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                              initialName: _name,
                              initialEmail: _email,
                              initialPhone: _phone,
                            ),
                          ),
                        );

                        if (updatedData != null) {
                          setState(() {
                            _name = updatedData['name'];
                            _email = updatedData['email'];
                            _phone = updatedData['phone'];
                          });
                        }
                      },
                      child: const Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
