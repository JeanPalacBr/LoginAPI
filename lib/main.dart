import 'package:flutter/material.dart';
import 'package:login/Pages/Login.dart';
import 'package:provider/provider.dart';
import 'Provider/AccountState.dart';
void main() {
  
  
runApp(
  ChangeNotifierProvider(
    
  builder: (context) => AccountState(),  
  
  child:Login(),
  ),
);
}
