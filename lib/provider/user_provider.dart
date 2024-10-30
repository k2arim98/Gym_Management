import 'package:flutter/material.dart';
import 'package:gym_management/models/user.dart'; // Import the User model

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
