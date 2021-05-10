import 'package:flutter/material.dart';
import '../../models/colors_HexColor.dart';

class LoadingPage extends StatelessWidget {
  //Toggle during setting the theme
  // final bool darkTheme;
  // ErrorPage({this.darkTheme});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_run,
              size: 100,
              color: HexColor("#bb86fc"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'LOADING',
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
