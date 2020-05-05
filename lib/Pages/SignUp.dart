import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Provider/AccountState.dart';
import 'package:provider/provider.dart';
import 'package:login/UserHandler.dart';
import 'package:string_validator/string_validator.dart';

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

void _onpressedSignUp(
    var context, String email, String _password, String userna, String nam) {
  final AcState = Provider.of<AccountState>(context);
  signUp(email: email, password: _password, username: userna, name: nam)
      .then((user) {
    return Text("Exitoo!");
  }).catchError((error) {
    //return _buildDialog(context, "Error", error.toString());
  }).timeout(Duration(seconds: 10), onTimeout: () {
    //return _buildDialog(context, "Error", "Timeout > 10secs");
  });
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
            ),
            TextFormField(
              autofocus: true,
              controller: _username,
              decoration: new InputDecoration(
                  labelText: "Username", hintText: "username"),
              validator: (Value2) {
                if (Value2.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _name,
              decoration:
                  new InputDecoration(labelText: "Name", hintText: "Name"),
              validator: (Value3) {
                if (Value3.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _password,
              decoration: new InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (Value4) {
                if (Value4.isEmpty) {
                  return 'Por favor ingrese algun texto';
                }
              },
            ),
            RaisedButton(
              child: Text("Register!"),
              onPressed: () {
                setState(() {
                  if (isEmail(_email.value.text)) {
                    _onpressedSignUp(
                        context,
                        _email.value.text,
                        _password.value.text,
                        _username.value.text,
                        _name.value.text);
                  } else {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Invalid Email')));
                  }
                  Navigator.pop(globalContext);
                });
              },
            )
          ],
        ));
  }
}
