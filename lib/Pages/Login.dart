import 'package:flutter/material.dart';
import 'package:login/Pages/SignUp.dart';
import 'package:login/Provider/AccountState.dart';
import 'package:login/UserHandler.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'package:string_validator/string_validator.dart';

var contextsc;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    contextsc = context;
    final AcState = Provider.of<AccountState>(context);
    AcState.getpreferences();
    return MaterialApp(
        title: "Login",
        home: Scaffold(
          //resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: AcState.getlogin ? HomePage() : islogged(),
        ));
    //home: AcState.getlogin? Home():islogged());
  }
}

class islogged extends StatefulWidget {
  isloggedstate createState() => isloggedstate();
}

class loginform extends StatefulWidget {
  @override
  loginformState createState() {
    return loginformState();
  }
}

void _onpressedlogin(var context, String email, String _password) {
  final AcState = Provider.of<AccountState>(context);
  signIn(email: email, password: _password).then((user) {
    Provider.of<AccountState>(context, listen: false)
        .setLoggedin(user.username, user.token);
    return Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Logged In')));
  }).catchError((error) {
    return Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Error" + error.toString())));
  }).timeout(Duration(seconds: 10), onTimeout: () {
    return Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Timeout error")));
  });
}

class loginformState extends State {
  @override
  Widget build(BuildContext context) {
    final AcState = Provider.of<AccountState>(context);

    final _signUpfkey = GlobalKey<FormState>();
    var Value;
    final _email = new TextEditingController();
    final _password = new TextEditingController();
    return Form(
        key: _signUpfkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Sign In",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                autofocus: true,
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                    labelText: "Email", hintText: "a@a.com"),
              ),
              TextFormField(
                autofocus: true,
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                controller: _password,
              ),
              RaisedButton(
                child: Text("Log In!"),
                onPressed: () {
                  if (isEmail(_email.value.text)) {
                    _onpressedlogin(
                        context, _email.value.text, _password.value.text);

                    if (AcState.getlogin == true) {
                      AcState.setpreferences();
                    } else {
                      return "Invalid Email or Password";
                    }
                  } else {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid Email or password')));
                  }
                },
              )
            ],
          ),
        ));
  }
}

class isloggedstate extends State {
  @override
  bool auxlog = true;
  Widget build(BuildContext context) {
    final AcState = Provider.of<AccountState>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.airline_seat_individual_suite,
            size: 100,
          ),
          loginform(),
          Text("or"),
          RaisedButton(
            child: Text("Sign Up"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
        ],
      ),
    );
  }
}
