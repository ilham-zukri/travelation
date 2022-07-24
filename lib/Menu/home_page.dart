import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tugaskelompok/Detail/rajaampat.dart';
import '../test_auth.dart';
import 'data.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xffD4E0F5), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.03, 0.9, 2],
                ),
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    // margin: EdgeInsets.only(top: height / 12),
                    width: width,
                    height: height / 15,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Selamat datang,",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                FirebaseAuth.instance.currentUser!.displayName
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        const Spacer(
                          flex: 88,
                        ),
                        Flexible(
                          flex: 40,
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Image(
                              image:
                                  AssetImage("assets/images/notification.png"),
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  // color: Colors.green,
                  width: width,
                  height: height / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          "Mau liburan kemana kali ini",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: width,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3)),
                                      BoxShadow(
                                          color: Colors.white.withOpacity(1),
                                          spreadRadius: -2,
                                          blurRadius: 3),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(9),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search),
                                        hintText: "Cari Tempat Liburan",
                                        hintStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TestAuth();
                                    }));
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/search_setting.png'),
                                    width: 44,
                                    height: 44,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*Selector Button*/
                      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        height: 36,
                        // color: Colors.red,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor1 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Indonesia',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor1,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor2 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Vietnam',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor2,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor3 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Thailand',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor3,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor4 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Malaysia',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor4,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor5 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Singapore',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor5,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  resetColor();
                                  _selectedColor6 = _selectedColor;
                                });
                              },
                              child: const Text(
                                'Philippines',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: _selectedColor6,
                              elevation: 3,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /*Carousel / Horizontal Scroll*/
                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  // color: Colors.blue,
                  height: 345,
                  width: width,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),

                      //rajaampat///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        // margin: const EdgeInsets.only(left: 20),
                        height: 345,
                        width: 247,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/rajaampat.png"),
                                fit: BoxFit.contain),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 18,
                                offset: const Offset(0, 7),
                              ),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            splashColor: Colors.white.withOpacity(0.5),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return detailRajaAmpat();
                              }));
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, right: 8),
                                      alignment: Alignment.topRight,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                        child: LikeButton(
                                          size: 18,
                                          circleColor: const CircleColor(
                                              start: Color(0xffff0000),
                                              end: Colors.pink),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor: Color(0xffe53380),
                                            dotSecondaryColor:
                                                Color(0xffe91e63),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              CupertinoIcons.suit_heart_fill,
                                              color: isLiked
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              size: 25,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 229, left: 16),
                                    child: const Text(
                                      "Raja Ampat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Row(
                                    children: [
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 14,
                                          )),
                                      Container(
                                        child: const Text(
                                          '4,8',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                      const SizedBox(
                                        width: 7.33,
                                      ),
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/loc.png'),
                                            width: 9.33,
                                            height: 11.33,
                                          )),
                                      Container(
                                        child: const Text(
                                          'Papua',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),

                      //Tanah Lot///////////////////////////////////////////////////////////////////////////////////
                      Container(
                        // margin: const EdgeInsets.only(left: 20),
                        height: 345,
                        width: 247,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/tanahlot.png'),
                                fit: BoxFit.contain),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 18,
                                offset: const Offset(0, 7),
                              ),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            splashColor: Colors.white.withOpacity(0.5),
                            onTap: () {},
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, right: 8),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                        child: LikeButton(
                                          size: 18,
                                          circleColor: const CircleColor(
                                              start: Color(0xffff0000),
                                              end: Colors.pink),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor: Color(0xffe53380),
                                            dotSecondaryColor:
                                                Color(0xffe91e63),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              CupertinoIcons.suit_heart_fill,
                                              color: isLiked
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              size: 25,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 229, left: 16),
                                    child: const Text(
                                      "Tanah Lot",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Row(
                                    children: [
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 14,
                                          )),
                                      Container(
                                        child: const Text(
                                          '4,6',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                      const SizedBox(
                                        width: 7.33,
                                      ),
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/loc.png'),
                                            width: 9.33,
                                            height: 11.33,
                                          )),
                                      Container(
                                        child: const Text(
                                          'Bali',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        // margin: const EdgeInsets.only(left: 20),
                        height: 345,
                        width: 247,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/bromo.png'),
                                fit: BoxFit.contain),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 18,
                                offset: const Offset(0, 7),
                              ),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            splashColor: Colors.white.withOpacity(0.5),
                            onTap: () {},
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, right: 8),
                                        alignment: Alignment.topRight,
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          child: LikeButton(
                                            size: 18,
                                            circleColor: const CircleColor(
                                                start: Color(0xffff0000),
                                                end: Colors.pink),
                                            bubblesColor: const BubblesColor(
                                              dotPrimaryColor:
                                                  Color(0xffe53380),
                                              dotSecondaryColor:
                                                  Color(0xffe91e63),
                                            ),
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                CupertinoIcons.suit_heart_fill,
                                                color: isLiked
                                                    ? Colors.pink
                                                    : Colors.grey,
                                                size: 25,
                                              );
                                            },
                                          ),
                                        )),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 229, left: 16),
                                    child: const Text(
                                      "Gunung Bromo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Row(
                                    children: [
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 14,
                                          )),
                                      Container(
                                        child: const Text(
                                          '4,7',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                      const SizedBox(
                                        width: 7.33,
                                      ),
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/loc.png'),
                                            width: 9.33,
                                            height: 11.33,
                                          )),
                                      Container(
                                        child: const Text(
                                          'Jawa Timur',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        margin:
                                            const EdgeInsets.only(left: 5.33),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24, left: 20),
                      child: const Text(
                        'Kategori',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 28, left: 180),
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3070D9)),
                      ),
                    )
                  ],
                ),

                //Horizontal Scroll/////////////////////////////////////////////////////////////////////////////////////////////////
                Container(
                  height: 51,
                  margin: const EdgeInsets.only(top: 12),
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 41,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: const Offset(0, 1)),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/gunung.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: const Text(
                                    'Gunung',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 41,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: const Offset(0, 1)),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/lautan.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: const Text(
                                    'Lautan',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 41,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: const Offset(0, 1)),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/pulau.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: const Text(
                                    'Pulau',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 41,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: const Offset(0, 1)),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/candi.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: const Text(
                                    'Candi',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 41,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: const Offset(0, 1)),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 12),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/pantai.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    top: 15.5,
                                    bottom: 15.5,
                                  ),
                                  child: const Text(
                                    'Pantai',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, top: 24),
                  child: Text(
                    'Tempat Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),

                Container(
                  width: 338,
                  height: 228,
                  margin: EdgeInsets.only(top: 16, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 166,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/borobudur.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 155,
                                height: 50,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 8),
                                        child: const Text(
                                          "Candi Borobudur",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 9.33),
                                      child: Row(
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 12.67,
                                          ),
                                          Container(
                                            child: const Text(
                                              '4,7',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                          const SizedBox(
                                            width: 7.33,
                                          ),
                                          const Align(
                                              alignment: Alignment.center,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/loc.png'),
                                                width: 9.33,
                                                height: 11.33,
                                              )),
                                          Container(
                                            child: const Text(
                                              'Jawa Tengah',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.5, left: 151),
                                child: LikeButton(
                                  size: 30,
                                  circleColor: const CircleColor(
                                      start: Color(0xffff0000),
                                      end: Colors.pink),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xffe53380),
                                    dotSecondaryColor: Color(0xffe91e63),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      CupertinoIcons.suit_heart_fill,
                                      color:
                                          isLiked ? Colors.pink : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 338,
                  height: 228,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 166,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/rinjani.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 155,
                                height: 50,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 8),
                                        child: const Text(
                                          "Gunung Rinjani",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 9.33),
                                      child: Row(
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 12.67,
                                          ),
                                          Container(
                                            child: const Text(
                                              '4,6',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                          const SizedBox(
                                            width: 7.33,
                                          ),
                                          const Align(
                                              alignment: Alignment.center,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/loc.png'),
                                                width: 9.33,
                                                height: 11.33,
                                              )),
                                          Container(
                                            child: const Text(
                                              'Lombok',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.5, left: 151),
                                child: LikeButton(
                                  size: 30,
                                  circleColor: const CircleColor(
                                      start: Color(0xffff0000),
                                      end: Colors.pink),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xffe53380),
                                    dotSecondaryColor: Color(0xffe91e63),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      CupertinoIcons.suit_heart_fill,
                                      color:
                                          isLiked ? Colors.pink : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 338,
                  height: 228,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 166,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/pinkbeach.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 155,
                                height: 50,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 8),
                                        child: const Text(
                                          "Pink Beach",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 9.33),
                                      child: Row(
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            width: 13.34,
                                            height: 12.67,
                                          ),
                                          Container(
                                            child: const Text(
                                              '4,7',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                          const SizedBox(
                                            width: 7.33,
                                          ),
                                          const Align(
                                              alignment: Alignment.center,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/loc.png'),
                                                width: 9.33,
                                                height: 11.33,
                                              )),
                                          Container(
                                            child: const Text(
                                              'Lombok',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 5.33),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.5, left: 151),
                                child: LikeButton(
                                  size: 30,
                                  circleColor: const CircleColor(
                                      start: Color(0xffff0000),
                                      end: Colors.pink),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xffe53380),
                                    dotSecondaryColor: Color(0xffe91e63),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      CupertinoIcons.suit_heart_fill,
                                      color:
                                          isLiked ? Colors.pink : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ],
        ),
        /*BottomNavBar*/
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        bottomNavigationBar: Container(
          width: width,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: _selectedColor,
                hoverColor: _selectedColor,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: _selectedColor,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.home,
                    text: 'Beranda',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: CupertinoIcons.compass,
                    text: 'Jelajah',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: CupertinoIcons.ticket,
                    text: 'Tiket',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: CupertinoIcons.person,
                    text: 'Profile',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  final Color _selectedColor = const Color(0xff3070D9);
  Color _selectedColor1 = const Color(0xff3070D9);
  Color _selectedColor2 = const Color(0xffE0E0E0);
  Color _selectedColor3 = const Color(0xffE0E0E0);
  Color _selectedColor4 = const Color(0xffE0E0E0);
  Color _selectedColor5 = const Color(0xffE0E0E0);
  Color _selectedColor6 = const Color(0xffE0E0E0);

  Color _selectedTabIconColor1 = Colors.black;
  Color _selectedTabIconColor2 = Colors.black;
  Color _selectedTabIconColor3 = Colors.black;

  void resetColor() {
    _selectedColor1 = const Color(0xffE0E0E0);
    _selectedColor2 = const Color(0xffE0E0E0);
    _selectedColor3 = const Color(0xffE0E0E0);
    _selectedColor4 = const Color(0xffE0E0E0);
    _selectedColor5 = const Color(0xffE0E0E0);
    _selectedColor6 = const Color(0xffE0E0E0);
  }
}
