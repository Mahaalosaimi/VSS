import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:trytr/email_auth.dart';
//import 'package:trytr/Profile.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _auth = FirebaseAuth.instance;
  //TextEditingController myController = TextEditingController();

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  // void OtpMessage() {
  //   myauth.setConfig(
  //       appEmail: "VSS@gmail.com",
  //       appName: "Email OTP",
  //       userEmail: email, //email.text,
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

  late String name;
  late String email;
  late String password;
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30,
                top: 40,
              ),
              child: Text(
                '    Create Account',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/logo.png'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            //controller: myController,
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              validator: (value) =>
                                  value!.isEmpty || !value.contains("@")
                                      //EmailValidator.validate(email)
                                      ? "enter a valid eamil"
                                      : null,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  //errorText: "",
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      //Navigator.pushNamed(context);
                                      //print(name);
                                      //print(email);
                                      //print(password);
                                      try {
                                        UserCredential newUser = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);

                                        User? user = newUser.user;
                                        //user?.updateDisplayName(name);
                                        await user?.updateDisplayName(name);
                                        await user?.reload();
                                        User? latestUser =
                                            FirebaseAuth.instance.currentUser;
                                        print('${latestUser?.displayName}');
                                        //OtpMessage();
                                        // myauth.setConfig(
                                        //     appEmail: "VSS@gmail.com",
                                        //     appName: "Email OTP",
                                        //     userEmail: email, //email.text,
                                        //     otpLength: 6,
                                        //     otpType: OTPType.digitsOnly);
                                        // if (await myauth.sendOTP() == true) {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(const SnackBar(
                                        //     content: Text("OTP has been sent"),
                                        //   ));
                                        // } else {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(const SnackBar(
                                        //     content:
                                        //         Text("Oops, OTP send failed"),
                                        //   ));
                                        // }
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) => MyApp()));
                                        Navigator.pushNamed(context, 'Email');
                                        // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyApp(myauth)));
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "The password provided is too weak."),
                                          ));
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "The account already exists for that email."),
                                          ));
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                      //UserCredential newUser = await _auth.createUserWithEmailAndPassword(email, password);

//await userCred.user.updateProfile(displayName: "Your Name");
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
