import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors_HexColor.dart';
import '../firebase_authentication/authentication_service.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Color themeBackground = HexColor("#bb86fc");
    final AuthenticationService authenticationService =
        new AuthenticationService();

    return Consumer<AuthenticationService>(builder: (
      context,
      data,
      __,
    ) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.user.uid,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
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
                  await authenticationService.signOut();
                  data.stateChanged(null);
                },
                child: Text(
                  'SIGN OUT',
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
          ],
        ),
      );
    });
  }
}
