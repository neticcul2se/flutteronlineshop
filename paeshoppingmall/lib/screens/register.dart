import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//Explicit

final formKey = GlobalKey<FormState>();

String nameString,emailString,passwordString;
//method

  Widget registerButton() {
    return IconButton(
        icon: Icon(Icons.cloud_upload),
        onPressed: () {
          print('you click upload');
          if(formKey.currentState.validate()){
            formKey.currentState.save();
            print('name =$nameString,email=$emailString,password=$passwordString');
          }
        });
  }

  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          color: Colors.purple.shade500,
          size: 32.0,
        ),
        labelText: 'Display Name :',
        labelStyle:
            TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        helperText: 'Type your Nick Nmae For display',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),validator: (String value){
        if (value.isEmpty) {
          return 'Plase Fill Your Name in the Blank';
        } else {
          return null;
        }
      },onSaved:(String value){
        nameString = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
 
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.green.shade800),
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: Colors.green.shade500,
          size: 32.0,
        ),
        labelText: 'Email:',
        labelStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        helperText: 'Type your email',
        helperStyle:
            TextStyle(color: Colors.green, fontStyle: FontStyle.italic),
      ),validator: (String value){
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Plase Type Email Format Exp. Your@email.com';
          
        } else {
          return null;
        }

      },onSaved:(String value){
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
       obscureText:true,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: Colors.blue.shade500,
          size: 32.0,
        ),
        labelText: 'Password :',
        labelStyle:
            TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Type your Password more 6 charactor',
        helperStyle:
            TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
      ),validator: (String value) {
        if (value.length < 6 ) {
          return 'Password more 6 charactor';
        } else {
          return null;
        }
      },onSaved:(String value){
        passwordString = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
          title: Text('Register'),
          actions: <Widget>[registerButton()],
        ),
        body: Form(key: formKey,
                  child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ));
  }
}
