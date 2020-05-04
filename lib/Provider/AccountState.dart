import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountState with ChangeNotifier {
  AccountState();

  bool _IsLogged = false;
  bool _LoggedStored;
  String _Email;
  String _Password;
  String _EmailStored;
  String _PasswordStored;
  String _Username;
  String _Token;

  void setLoggedin(String usern, String token){
      _Token = token;
      _Username = usern;
      _IsLogged = true;
    notifyListeners();
  }
  
  void setEmail(String email) {
    _Email = email;
    notifyListeners();
  }
  void setLogout() {
    _IsLogged = false;
    notifyListeners();
  }

  void setPassword(String password) {
    _Password = password;
    notifyListeners();
  }

  bool get getlogin => _IsLogged;
  String get getEmail => _Email;
   String get getUsername => _Username;

  void getpreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _IsLogged = preferences.get("islogged") ?? false;
  }

  void setpreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("islogged", _IsLogged);
  }
}
