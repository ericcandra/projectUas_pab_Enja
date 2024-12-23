import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Import halaman Edit Profile yang akan dibuat

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile.jpg'), // Gambar profil
                  ),
                  const SizedBox(height: 16),

                  // Name
                  const Text(
                    'Eric Candra',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  const Text(
                    'ericcandra@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Phone Number
                  const Text(
                    '+62 812 1555 9999',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Additional Details
                  const Divider(height: 1, thickness: 1, color: Colors.grey),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.cake, color: Colors.blue, size: 30),
                          SizedBox(height: 8),
                          Text(
                            'Birthday',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            '29 Oktober 2001',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.location_city, color: Colors.blue, size: 30),
                          SizedBox(height: 8),
                          Text(
                            'Kota',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            'Palembang',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Edit Button
                  ElevatedButton(
                    onPressed: () {
                      // Menavigasi ke halaman Edit Profile saat tombol ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
