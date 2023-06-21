import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trytr/Profile.dart';
import 'package:trytr/UserGuide.dart';
import 'package:trytr/email_auth.dart';
import 'package:trytr/fetch.dart';
import 'package:trytr/forgot_password.dart';
import 'package:trytr/homepagetest.dart';
import 'package:trytr/login.dart';
import 'package:trytr/register.dart';
import 'package:trytr/update.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var StateKey;
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      // 'Email': (context) => const MyApp(),
      'Email': (context) => const MyApp(),
      'home_page': (context) => const MyApp1(),
      'ForgetPassword': (context) => const ForgotPassword(),
      'Profile': (context) => const Profile(),
      'UserGuide': (context) => const Userguide(),
      'FetchData': (context) => const FetchData(),
      'UpdateRecord': (context) => UpdateRecord(StateKey: StateKey),
    },
  ));
}
