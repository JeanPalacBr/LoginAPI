import 'package:flutter/material.dart';
import 'package:login/Pages/Login.dart';
import 'package:login/Provider/AccountState.dart';
import 'package:provider/provider.dart';
import 'Login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AcState = Provider.of<AccountState>(context);
    return MaterialApp(
        title: "Home",
        home: Scaffold(
          //resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: AcState.getlogin ? HomePage() : islogged(),
        ));
  }
}

class HomePage extends StatefulWidget {
  HomePagestate createState() => HomePagestate();
}

class HomePages extends StatefulWidget {
  @override
  HomePagestate createState() {
    return HomePagestate();
  }
}

class HomePagestate extends State {
  @override
  Widget build(BuildContext context) {
    final AcState = Provider.of<AccountState>(context);
    return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome!!!"),
          RaisedButton(
            child: Text("Log Out"),
            onPressed: () {
              AcState.setLogout();
            },
          )
        ],
      ),
    );
  }
}
