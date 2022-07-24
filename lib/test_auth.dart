import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugaskelompok/auth_services.dart';

class TestAuth extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test_Connection'),
      ),
      body: Container(
        width: width,
        color: Colors.grey,
        child: Column(
          children: [
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Signed In: ${snapshot.data?.uid}');
                } else {
                  return const Text("You haven't signed in yet");
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  FirebaseAuth.instance.signOut();
                } else {
                  FirebaseAuth.instance.signInAnonymously();
                }
              },
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Sign Out');
                  } else {
                    return Text("Sign In");
                  }
                },
              ),
            ),
            Text('Email'),
            ElevatedButton(
              onPressed: () {
                AuthServices.auth.signOut();
              },
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Sign Out');
                  } else {
                    return Text("Sign In");
                  }
                },
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  labelText: 'Masukan Alamat Email',
                  labelStyle:
                      const TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  // errorText: errorTextEmail,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  labelText: 'Masukan Nama',
                  labelStyle:
                      const TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            ElevatedButton(
              onPressed: () {
                users.add({
                  'name' : nameController.text,
                  'email': emailController.text
                }).catchError((e){
                  print(e);
                });
                nameController.clear();
                emailController.clear();
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
