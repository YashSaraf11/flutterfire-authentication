import 'package:flutter/material.dart';
import '../../models/colors_HexColor.dart';
import './signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../firebase_authentication/authentication_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Color gmailBackground = HexColor("#c71610");
    Color themeBackground = HexColor("#bb86fc");
    AuthenticationService authenticationService = new AuthenticationService();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Consumer<AuthenticationService>(builder: (
        context,
        data,
        __,
      ) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 100, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 80,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'There',
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                        color: themeBackground,
                        fontSize: 80,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      letterSpacing: 2.0,
                    ),
                    labelText: 'EMAIL',
                  ),
                  style: TextStyle(color: HexColor("#bb86fc")),
                  keyboardType: TextInputType.text,
                  controller: email,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      letterSpacing: 2.0,
                    ),
                    labelText: 'PASSWORD',
                  ),
                  style: TextStyle(color: HexColor("#bb86fc")),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: password,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.35, 20, width * 0.35, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: themeBackground,
                    onPressed: () async {
                      await authenticationService.signInWithEmailPassword(
                          email.text.toString(), password.text.toString());
                      final User user = FirebaseAuth.instance.currentUser;
                      print(user.uid);
                      data.stateChanged(user);
                    },
                    child: Text(
                      'SIGN IN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.18, 18, width * 0.1, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: gmailBackground,
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_to_home_screen,
                            color: Colors.white,
                          ),
                          Text(
                            ' SIGN IN WITH GOOGLE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Studify?',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final user = await Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new SignUp()));
                        print(user.uid);
                        data.stateChanged(user);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: themeBackground,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
