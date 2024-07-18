import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/registrationscreen.dart';
import 'screens/homescreen.dart';
import 'screens/feedscreen.dart';
import 'screens/storescreen.dart';
import 'screens/profilescreen.dart';
import 'screens/settingsscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/feed': (context) => FeedScreen(),
        '/store': (context) => StoreScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
