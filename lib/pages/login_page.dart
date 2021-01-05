import 'package:awesapp/bg_image.dart';
import 'package:awesapp/utils/Constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            BgImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                                child: Column(children: [
                              Text(
                                "Login Form",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Username",
                                      labelText: "Username")),
                              SizedBox(height: 20),
                              TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter Password",
                                      labelText: "Password")),
                              SizedBox(height: 20),
                              RaisedButton(
                                onPressed: () {
                                  Constants.prefs.setBool('loggedIn', true);
                                  print('should redirect to home');
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                },
                                child: Text("Sign In"),
                              )
                            ])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
