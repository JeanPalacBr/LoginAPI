import 'package:flutter/material.dart';
import 'package:login/Pages/SignUp.dart';
import 'package:login/Provider/AccountState.dart';
import 'package:provider/provider.dart';
import 'Home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
                decoration: new InputDecoration(
                    labelText: "Email", hintText: "a@a.com"),
                validator: (Value) {
                  if (Value.isEmpty) {
                    return 'Por favor ingrese algun texto';
                  }
                },
              ),
              TextFormField(
                autofocus: true,
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                controller: _password,
                validator: (Value2) {
                  if (Value.isEmpty) {
                    return 'Por favor ingrese algun texto';
                  }
                },
              ),
              RaisedButton(
                child: Text("Log In!"),
                onPressed: () {
                  AcState.setLogin(_email.value.text, _password.value.text);
                  if(AcState.getlogin==true){
                  AcState.setpreferences();  
                  }else{
                    return "usuario o contraseña invalidos";
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
