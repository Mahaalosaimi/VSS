// ignore_for_file: prefer_const_constructors

/*
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Email(),
  ));
}

class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: IconButton(
                    color: Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    icon: Icon(
                      (Icons.arrow_back),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          cursorColor: Color.fromARGB(156, 255, 120, 241),
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: "User Email",
                            border: InputBorder.none,
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(156, 0, 0, 0),
                        ),
                        onPressed: () async {
                          myauth.setConfig(
                              appEmail: "me@rohitchouhan.com",
                              appName: "Email OTP",
                              userEmail: email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly);
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),
                  ],
                ),
              ),
              Card(
                //elevation: 0,
                //color: Theme.of(context).colorScheme.surfaceVariant,
                //color: Colors.grey,
                //borderOnForeground: mounted,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          cursorColor: Color.fromARGB(156, 255, 120, 241),
                          keyboardType: TextInputType.number,
                          controller: otp,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            /*fillColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 145, 101, 192)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )*/
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(156, 0, 0, 0),
                        ),
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                            Navigator.pushNamed(context, 'home_page');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        },
                        child: const Text("Verify")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  late User signedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    //OtpMessage();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void OtpMessage() {
  //   myauth.setConfig(
  //       appEmail: "VSS@gmail.com",
  //       appName: "Email OTP",
  //       userEmail: user.email!, //email.text,
  //       otpLength: 6,
  //       otpType: OTPType.digitsOnly);
  //   if (myauth.sendOTP() == true) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("OTP has been sent"),
  //     ));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Oops, OTP send failed"),
  //     ));
  //   }
  // }

  //TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    // ElevatedButton button;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: IconButton(
                    color: Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    icon: Icon(
                      (Icons.arrow_back),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                child: Column(
                  children: [
                    // Text("data");

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "click the button below to send an OTP to " +
                            user.email!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                    ),

                    // OtpMessage.call();

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () async {
                          myauth.setConfig(
                              appEmail: "VSS@gmail.com",
                              appName: "Email OTP",
                              userEmail: user.email!, //email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly);
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),

                    // button.onPressed?.call(),
                  ],
                ),
              ),
              Card(
                //elevation: 0,
                //color: Theme.of(context).colorScheme.surfaceVariant,
                //color: Colors.grey,
                //borderOnForeground: mounted,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          cursorColor: Color.fromARGB(156, 255, 120, 241),
                          keyboardType: TextInputType.number,
                          controller: otp,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            /*fillColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 145, 101, 192)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )*/
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                            Navigator.pushNamed(context, 'home_page');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        },
                        child: const Text("Verify")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
