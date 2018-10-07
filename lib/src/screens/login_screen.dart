import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {

    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email",
              errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "password",
              labelText: "Password",
              errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: (){},
      child: Text('Login'),
      color: Colors.lightBlue,
      textColor: Colors.white,
    );
  }

}