import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class detailRajaAmpat extends StatefulWidget {
  const detailRajaAmpat({Key? key}) : super(key: key);

  @override
  State<detailRajaAmpat> createState() => _detailRajaAmpatState();
}

class _detailRajaAmpatState extends State<detailRajaAmpat> {
  final assetsImages = [
    'assets/images/rajaampat/1.png',
    'assets/images/rajaampat/2.png',
    'assets/images/rajaampat/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Detail",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
        actions: [
          PopupMenuButton<int>(
              itemBuilder: (context) =>
                  [PopupMenuItem(child: Text("Settings"))])
        ],
      ),
      body: Stack(
        children: <Widget>[
          //
          Expanded(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.4,
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
                  height: size.height * 0.4,
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(12, 5, 12, 16),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 325,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 325,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: assetsImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final assetImages = assetsImages[index];

                    return buildImage(assetImages, index);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: SizedBox(
                    height: 311,
                    child: ListView(
                      children: [
                        Container(
                          child: Text(
                            "Raja Ampat",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.33, right: 19.33),
                              child: Text(
                                "4,7",
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 14),
                              ),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                            Container(
                              child: Text("Papua",
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14)),
                            )
                          ],
                        ),
                        Container(
                          child: Text(
                              "Raja Ampat merupakan sebuah kabupaten di Provinsi Papu Barat. Kabupaten ini memiliki empat pulau besar yaitu Pulau Waigeo, Batanta, Salawati, dan Misool. Selain itu ada juga 1.847 pulau kecil yang ada di Raja Ampat.",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                              textAlign: TextAlign.justify),
                        ),
                        Container(
                          child: Text(
                              "Raja Ampat terletak di bagian barat Papua dan memiliki luas kurang lebih 4,6 juta hektar. Raja Ampat merupakan surga yang berada di wilayah Indonesia timur",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                              textAlign: TextAlign.justify),
                        ),
                        Container(
                          child: Text(
                            "ada kurang lebih 75% spesies karang dunia di kepulauan ini. Selain itu, Raja Ampat juga memiliki 1.318 jenis ikan, 699 moluska, dan 547 terumbu karang.",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          child: Text(
                              "kepulauan ini diketahui berada di jantung Segitiga Terumbu Karang Dunia. Arus laut dalam yang kuat membawa banyak nutrisi di perairan ini hingga ke hutan bakau, danau air asin, dan hamparan padang lamuan.",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                              textAlign: TextAlign.justify),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text(
                        "IDR 5.800.000",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 169,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            onPrimary: Colors.blue,
                            shape: StadiumBorder(),
                            shadowColor: Colors.black,
                          ),
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return calendar();
                            // }));
                          },
                          child: Text(
                            "Selanjutnya",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String assetImages, int index) => Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(assetImages),
            fit: BoxFit.fitHeight,
          )));
}
