import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if(form.validate()) {
      form.save();
      print('Form is valid. Email $_email, password $_password');
    } else {
      print('Form not invalid. Email $_email, password $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter login demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value)=> _email = value , // save email
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Password'),
                validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                obscureText: true,
                onSaved: (value) => _password = value ,
              ),
              new RaisedButton(
                child: new Text('Login',style: new TextStyle(fontSize: 20.0)),
                onPressed: validateAndSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

