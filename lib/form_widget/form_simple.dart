import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  //String name = "";
  //String password = "";
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length <= 8) {
                    return "more than 8";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print("Username: ${_username.text}");
                      print("Password: ${_password.text}");
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ));
  }
}
