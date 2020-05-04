import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/Login.dart';
import 'package:login/Provider/AccountState.dart';
import 'package:provider/provider.dart';
var globalContext;
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    // TODO: implement build
    return MaterialApp(
        title: "Login",
        home: Scaffold(
          //resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("SignUp"),
          ),
          body: signupform(),
        ));
  }
}

class signupform extends StatefulWidget {
  @override
  signupformState createState() {
    return signupformState();
  }
}

class signupformState extends State {
  @override
  Widget build(BuildContext context) {
    final _signUpfkey = GlobalKey<FormState>();
    final AcState = Provider.of<AccountState>(context);
    final _email = new TextEditingController();
    final _password = new TextEditingController();
    final _name = new TextEditingController();
    final _username = new TextEditingController();
    var Value;

    return Form(
        key: _signUpfkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "SignUP!",
              style: TextStyle(fontSize: 30),
            ),
            TextFormField(
              autofocus: true,
              controller: _email,
              decoration:
                  new InputDecoration(labelText: "Email", hintText: "a@a.com"),
              validator: (Value) {
                if (Value.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),TextFormField(
              autofocus: true,
              controller: _username,
              decoration:
                  new InputDecoration(labelText: "Username", hintText: "username"),
              validator: (Value) {
                if (Value.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),TextFormField(
              autofocus: true,
              controller: _name,
              decoration:
                  new InputDecoration(labelText: "Name", hintText: "Name"),
              validator: (Value) {
                if (Value.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _password,
              decoration: new InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (Value2) {
                if (Value.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),
            RaisedButton(
              child: Text("Register!"),
              onPressed: () {
                setState(() {
                  AcState.setEmail(_email.value.text);
                  AcState.setPassword(_password.value.text);
                  Navigator.pop(globalContext);
                });
              },
            )
          ],
        ));
  }
}
