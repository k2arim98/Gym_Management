import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import 'package:gym_management/models/user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      body: ProfileContent(user: userProvider.user),
    );
  }
}

class ProfileContent extends StatelessWidget {
  final User? user;

  ProfileContent({this.user});

  @override
  Widget build(BuildContext context) {
    // Check if user data is available
    final userName = user?.fullName ?? 'K2arim98';
    final userEmail = user?.email ?? 'karim@example.com';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.black54],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            Divider(
              color: Colors.white70,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.orange),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                userEmail,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.orange),
              title: Text(
                'Phone Number',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '+1234567890', // Placeholder, adjust if you have phone number
                style: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the edit profile screen or show an edit dialog
              },
              icon: Icon(Icons.edit, color: Colors.black),
              label: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
