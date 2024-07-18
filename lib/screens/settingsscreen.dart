import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      body: SettingsContent(),
    );
  }
}

class SettingsContent extends StatelessWidget {
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
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Handle notifications switch
              },
              activeColor: Colors.orange,
            ),
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.orange),
            title: Text(
              'Privacy',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.orange),
            title: Text(
              'Account',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to account settings
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.language, color: Colors.orange),
            title: Text(
              'Language',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to language settings
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.help, color: Colors.orange),
            title: Text(
              'Help & Support',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to help & support
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.info, color: Colors.orange),
            title: Text(
              'About',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to about screen
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.orange),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
