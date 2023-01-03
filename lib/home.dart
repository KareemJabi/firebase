import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '';
//retrive data from firebase
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late String email ='' ;
  late String fullname='';
  DocumentReference users = FirebaseFirestore.instance.collection("User")
      .doc("taZnCIdG1qT1upAm5X6I");
  void initState(){
    super.initState();
    users.get().then((DocumentSnapshot ds){
      email =ds['email'];
      fullname=ds['fullname'];
      print(email);
    });
    print('email');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text(email),
              Text('${fullname}'),
            ],
          ),

        ),
      ),
    );
  }
}
