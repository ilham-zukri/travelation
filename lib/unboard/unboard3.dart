import 'package:flutter/material.dart';
import 'package:tugaskelompok/login/login.dart';

class unboard3 extends StatelessWidget {
  const unboard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 132, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRect(
                  child: Image(image: AssetImage('assets/images/unboard3.png')),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Text(
                          "Terbang ke tempat liburan anda",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          "Akhirnya, bersiaplah untuk tur dan pergi ke tujuan yang Anda inginkan.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 53, 20, 65),
                        child: SizedBox(
                          height: 44,
                          width: size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return login();
                              }));
                            },
                            child: Text(
                              "Mulai menjelajah",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onPrimary: Colors.blue,
                              shape: StadiumBorder(),
                              shadowColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return login();
                                }));
                              },
                              child: Text(
                                "LEWATI",
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shape: StadiumBorder(),
                                shadowColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(1),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                width: 31,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
