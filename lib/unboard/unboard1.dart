import 'package:flutter/material.dart';
import 'package:tugaskelompok/login/login.dart';
import 'package:tugaskelompok/unboard/unboard2.dart';

class unboard1 extends StatelessWidget {
  const unboard1({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.fromLTRB(10, 132, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRect(
                  child: Image(image: AssetImage('assets/images/unboard1.png')),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Text(
                          "Pilih tujuan liburan anda",
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
                          "Pilih tempat untuk perjalanan Anda dengan mudah dan ketahui biaya perjalanan yang tepat.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
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
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(1),
                              width: 31,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
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
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return unboard2();
                              }));
                            },
                            child: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
