import 'package:firebasetest/home.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  late String email;
  late String password;
  late String fullname;
  late String phoneNumber;
  Future Signin() async {
    adduser(
      email,
      password,
      fullname,
      phoneNumber,
    );
  }

  Future adduser(String email, String password, String fullname,
      String phonenumber) async {
    await FirebaseFirestore.instance.collection('User').add({
      'email': email,
      'password': password,
      'fullname': fullname,
      'phonenumber': phonenumber,
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your full name',
              ),
              onChanged: (value) {
                fullname = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your email',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your phone number',
              ),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Signin();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
                },
                child: Text("sign in")),
          ],
        ),
      ),
    );
  }
}
