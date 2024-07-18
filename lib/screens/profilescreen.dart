import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Khelifa Abdelkarim',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'khelifa.abdelkarim98@gmail.com',
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
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.person, color: Colors.orange),
              title: Text(
                'Username',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'k2arim98',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.orange),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'khelifa.abdelkarim98@gmail.com',
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
                '+1234567890',
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
