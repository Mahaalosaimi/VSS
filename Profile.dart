import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trytr/login.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  User? latestUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //var displayName2 = latestUser?.displayName;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'home_page');
            },
          ),
          title: Text('Profile'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.nicepng.com/png/detail/301-3012711_png-file-profile-white-icon-png.png'),
              ),*/
              // ignore: prefer_const_constructors
              ProfilePicture(
                name: '${latestUser?.displayName}',
                radius: 31,
                fontsize: 21,
                random: true,
                count: 2,
              ),
              Text(
                '${latestUser?.displayName}',
                style: TextStyle(
                  fontSize: 38.0,
                  color: Color.fromARGB(255, 55, 54, 54),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black12,
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 20.0),
                color: Colors.black,
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  title: Text(
                    user.email!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.black,
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      heroTag: "logout",
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, "login");

                        //Navigator.pushNamed(context, 'login');
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 24.0,
                      ),
                      label: Text('logout'),
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.black,
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      heroTag: "delete",
                      onPressed: () async {
                        await user.delete();
                        Navigator.pushNamed(context, 'register');
                      },
                      icon: Icon(
                        Icons.delete_rounded,
                        size: 24.0,
                      ),
                      label: Text('delete account'),
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
