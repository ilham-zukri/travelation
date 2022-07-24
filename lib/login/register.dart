import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugaskelompok/Menu/home_page.dart';
import 'package:tugaskelompok/login/login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _loginState();
}

class _loginState extends State<register> {
  bool click = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //
          Container(
            child: Column(
              children: [
                Container(
                  height: size.height / 2,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.white, Color(0xffD4E0F5)],
                        center: Alignment.topLeft,
                        radius: 1,
                        stops: [0.5, 1]),
                  ),
                ),
                Container(
                  height: size.height / 2,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.white, Color(0xffD4E0F5)],
                        center: Alignment.bottomRight,
                        radius: 1,
                        stops: [0.5, 1]),
                  ),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              children: [
                ClipRect(
                  child: Image(image: AssetImage('assets/images/logo.png')),
                ),
                Container(
                    margin: EdgeInsets.only(top: 42, bottom: 29),
                    child: Text(
                      "Buat akun anda",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nama',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 4, bottom: 16),
                  height: 44,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Masukan Nama',
                        labelStyle:
                            TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 4, bottom: 16),
                  height: 44,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Masukan Alamat Email',
                        labelStyle:
                            TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text('Password',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(top: 4, bottom: 16),
                  height: 44,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Masukan Password'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                      height: 44,
                      width: 335,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            onPrimary: Colors.blue,
                            shape: StadiumBorder(),
                            shadowColor: Colors.black,
                          ),
                          onPressed: () async {
                            bool errorSignUp = false;
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                            } on FirebaseAuthException catch (e) {
                              errorSignUp = true;
                              (nameController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty)
                                  ? showNotification(
                                      context, e.message.toString())
                                  : null;
                            }
                            if (!errorSignUp &&
                                nameController.text.isNotEmpty) {
                              FirebaseAuth.instance.currentUser!
                                  .updateDisplayName(nameController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const login();
                                  },
                                ),
                              );
                            } else {
                              if (nameController.text.isEmpty) {
                                showNotification(context, 'Isi username');
                              } else if (emailController.text.isEmpty) {
                                showNotification(context, 'Isi Alamat Email');
                              } else if (passwordController.text.isEmpty) {
                                showNotification(context, 'Password');
                              }
                            }
                          },
                          child: Text(
                            "Buat Akun",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20),
                          ))),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "Atau Masuk dengan",
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/google.png')),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/facebook.png')),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/twitter.png')),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 8),
                            child: Text("Punya Akun Sebelumnya ?"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return login();
                                }),
                              );
                            },
                            child: Container(
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.blue),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Dengan mendaftar,Anda menyetujui",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 11),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Persyaratan",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 11,
                                    color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Kebijakan Privasi kami",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text(
          message.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
