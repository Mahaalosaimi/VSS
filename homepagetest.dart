import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

// ignore: unused_element
class _MyApp1State extends State<MyApp1> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("State");
  late String data;
  //late String statedata;
  String dataOut = '';

  @override
  void initState() {
    super.initState();
    read();
  }

  Future read() async {
    //DatabaseReference starCountRef = FirebaseDatabase.instance.ref('State'); old comments
    ref.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      if (data == 'detected') {
        Alert(
          context: context,
          title: "Alert",
          type: AlertType.warning,
          desc:
              "the sensor detect movement at your vehicle, please go and check",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(
                    color: Color.fromARGB(255, 211, 206, 206), fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.black,
              width: 120,
            )
          ],
        ).show();
      }
      print(data);
      //return data;
      data = data;
      setState(() {
        this.dataOut = data;
      });
    });
    // data = data;
    // setState(() {
    //   this.dataOut = data;
    // });
    //return data;
  }

  // Future data() async {
  //   // Get the data once
  //   DatabaseEvent event = await ref.once();
  //   final statedata = event.snapshot.value;
  //   return print(event.snapshot.value); // { "name": "John" }
  // }
  // Future border() async {
  //   await data;
  //   if(data == 'detected'){

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Stream<DatabaseEvent> stream = ref.onValue;
    // stream.listen((DatabaseEvent event) {
    //   // final data = event.snapshot.value.toString();
    //   data = event.snapshot.value.toString();
    //   // print('event type: ${event.type}');
    //   // print('snapshot: ${event.snapshot}');
    //   print('state: ${data}');
    //   if (data == 'detected') {
    //     Alert(
    //       context: context,
    //       title: "cation",
    //       desc: "motion detected",
    //     ).show();
    //   }
    // });
    // data = data;
    // read();
    // data = data;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('VSS'), backgroundColor: Colors.black),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dataOut == 'detected') ...[
                // show license
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(00.0, 00.0, 00.0, 40.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 0, 207, 65),
                    radius: 120,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ] else ...[
                // show error message
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(00.0, 00.0, 00.0, 40.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 120,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ],

              // Container(
              //   alignment: Alignment.topCenter,
              //   margin: EdgeInsets.fromLTRB(00.0, 00.0, 00.0, 40.0),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.grey,
              //     radius: 120,
              //     child: CircleAvatar(
              //       radius: 110,
              //       backgroundImage: AssetImage('assets/logo.png'),
              //     ),
              //   ),
              // ),

              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '''The app is ready to connect''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Color.fromARGB(255, 55, 54, 54),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       await ref.set({
              //         "State": "test",
              //       });
              //     },
              //     child: Text("write")),
              // ElevatedButton(
              //     onPressed: () async {
              //       DatabaseEvent event = await ref.once();
              //       final statedata = event.snapshot.value.toString();
              //       if (statedata == 'detected') {
              //         Alert(
              //           context: context,
              //           title: "cation",
              //           desc: "motion detected",
              //         ).show();
              //       }
              //       print(event.snapshot.value);
              //     },
              //     child: Text("read"))
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 30.0,
                        left: 10.0,
                        child: Text(
                          "VSS",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, 'Profile');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.article_rounded),
                  title: Text('User guide'),
                  onTap: () {
                    Navigator.pushNamed(context, 'UserGuide');
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
