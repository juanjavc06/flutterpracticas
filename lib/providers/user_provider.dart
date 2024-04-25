import 'package:flutter/material.dart';
import 'package:test/model/user.dart';

class UserProvider with ChangeNotifier {
  User? user;

  UserProvider();

  set setUser(User _user) {
    user = _user;
  }

  get _user => user;
}
