import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Userguide extends StatefulWidget {
  const Userguide({Key? key}) : super(key: key);

  @override
  _UserguideState createState() => _UserguideState();
}

// ignore: unused_element
class _UserguideState extends State<Userguide> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, 'home_page');
              },
            ),
            title: Text('User Guide'),
            backgroundColor: Colors.black,
          ),
          body: Wrap(crossAxisAlignment: WrapCrossAlignment.center,
              //margin: EdgeInsets.symmetric(vertical: 250.0),
              //color: Colors.black,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.beenhere_rounded,
                    color: Colors.black,
                    size: 80,
                  ),
                ),
                Row(
                  children: [
                    // FaIcon(
                    //   FontAwesomeIcons.lifeRing,
                    //   color: Colors.white,
                    // ),
                    Text(
                      '''


our system is designed to save people who get trapped 
in locked vehicle by accident. 
to get the best experience from this system:
''',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 10, 20),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.carSide,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      '''
1)you should install the hardware components
  at the vehicle roof top
''',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mobile,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      '''   
  2) keep this app installed in your phone
                      ''',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 6, 12),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.wifi,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(width: 15),
                    Text(
                      ''' 
3) WIFI connection is required
                      ''',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 1, 8, 15),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // FaIcon(
                    //   FontAwesomeIcons.lifeRing,
                    //   color: Colors.white,
                    // ),
                    Text(
                      '''the system will notify you automatically by push up 
notifications every time when he detect 
moving bodies while the vehicle is locked''',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/vssksa.jpg',
                      width: 300,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ],
                )
              ]),
          // Container(
          //  Text(
          //   'This app allow the user to overcome accident that lead to left adults or children accidentally in the vehicles using PIR sensor which dedicate the motion of human body temperature and sent a notification to this app',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 28.0,
          //     color: Color.fromARGB(255, 55, 54, 54),
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ));
  }
}

//This app allow the user to overcome accident that lead to left adults or children accidentally in the vehicles using PIR sensor which dedicate the motion of human body temperature and sent a notification to this app