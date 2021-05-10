import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider_login_app/firebase_authentication/authentication_service.dart';
import '../../models/colors_HexColor.dart';

// _fieldFocusChange(
//     BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
//   currentFocus.unfocus();
//   FocusScope.of(context).requestFocus(nextFocus);
// }

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final FocusNode emailNode = FocusNode();
    // final FocusNode passwordNode = FocusNode();
    // final FocusNode cpasswordNode = FocusNode();
    // final FocusNode submitNode = FocusNode();

    var width = MediaQuery.of(context).size.width;
    AuthenticationService authenticationService = new AuthenticationService();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor("#bb86fc"),
            ),
            tooltip: "Go Back",
            splashRadius: 50,
            splashColor: HexColor("#bb86fc"),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Up',
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
                      color: HexColor("#bb86fc"),
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
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 3.0,
                  ),
                  focusColor: HexColor("#bbe6fc"),
                  labelText: 'EMAIL',
                ),
                style: TextStyle(color: HexColor("#bb86fc")),
                keyboardType: TextInputType.emailAddress,
                controller: email,
                textInputAction: TextInputAction.done,
              ),
              TextFormField(
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
                textInputAction: TextInputAction.done,
                controller: password,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 2.0,
                  ),
                  labelText: 'CONFIRM PASSWORD',
                ),
                style: TextStyle(color: HexColor("#bb86fc")),
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: cpassword,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                // ignore: deprecated_member_use
                child: RaisedButton(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.36, 20, width * 0.36, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  color: HexColor("#bb86fc"),
                  onPressed: () async {
                    await authenticationService.signUpWithEmailPassword(
                        email.text.toString(), password.text.toString());
                    final User user = FirebaseAuth.instance.currentUser;
                    if (user.uid != null) Navigator.pop(context, user);
                  },
                  child: Text(
                    'SIGNUP',
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
                      EdgeInsets.fromLTRB(width * 0.18, 20, width * 0.18, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  color: HexColor("#c71610"),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      Text(
                        'SIGN UP WITH GOOGLE',
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
            ],
          ),
        ),
      ),
    );
  }
}
