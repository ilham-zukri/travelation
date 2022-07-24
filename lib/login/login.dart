import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugaskelompok/Menu/home_page.dart';
import 'package:tugaskelompok/auth_services.dart';
import 'package:tugaskelompok/login/register.dart';
import 'package:tugaskelompok/test_auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool click = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Backround
            Container(
              child: Column(
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
                      gradient: const RadialGradient(
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
              padding: const EdgeInsets.fromLTRB(20, 36, 20, 0),
              child: Column(
                children: [
                  const ClipRect(
                    child: const Image(
                        image: AssetImage('assets/images/logo.png')),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 42, bottom: 29),
                      child: const Text(
                        "Selamat datang penjelajah dunia",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 16),
                    height: 44,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          labelText: 'Masukan Alamat Email',
                          labelStyle: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 14)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text('Password',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 16),
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            click = !click;
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color:
                                  (click == true) ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(4, 0, 115, 0),
                        height: 20,
                        child: const Text(
                          "Ingat Saya",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 20,
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Lupa Password ?",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32, bottom: 16),
                    child: SizedBox(
                        height: 44,
                        width: 335,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                } on FirebaseAuthException catch (e) {
                                  showNotification(
                                      context, e.message.toString());
                                }
                              } else {
                                if (emailController.text.isEmpty) {
                                  showNotification(context, "Masukan Email");
                                } else {
                                  showNotification(context, "Masukan Password");
                                }
                              }

                              if(FirebaseAuth.instance.currentUser != null){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const HomePage();
                                    }));
                                AuthServices().email = FirebaseAuth.instance.currentUser!.email.toString();
                              } else{
                                null;
                              }

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onPrimary: Colors.blue,
                              shape: const StadiumBorder(),
                              shadowColor: Colors.black,
                            ),
                            child: const Text(
                              "MASUK",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 20),
                            ))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    child: const Text(
                      "Atau Masuk dengan",
                      style:
                          const TextStyle(fontFamily: 'Poppins', fontSize: 14),
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
                              onTap: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TestAuth();
                                }));
                              }),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: const AssetImage(
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
                                    image: const DecorationImage(
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
                                    image: const DecorationImage(
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
                    margin: const EdgeInsets.only(top: 96),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: const Text("Belum punya akun ?"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const register();
                            }));
                          },
                          child: Container(
                            child: const Text(
                              "Buat akun",
                              style: TextStyle(
                                  fontFamily: 'Poppins', color: Colors.blue),
                            ),
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
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueAccent, content: Text(message.toString(),style: const TextStyle(color: Colors.red),)));
  }
}
