import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/registrationscreen.dart';
import 'screens/homescreen.dart';
import 'screens/feedscreen.dart';
import 'screens/storescreen.dart';
import 'screens/profilescreen.dart';
import 'screens/settingsscreen.dart';
import 'package:provider/provider.dart';
import 'package:gym_management/provider/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/feed': (context) => FeedScreen(),
        '/store': (context) => StoreScreen(),
        '/settings': (context) => SettingsScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}
