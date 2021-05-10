import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider_login_app/screens/login_screens/login_page.dart';
import './models/colors_HexColor.dart';
import './screens/intialising_screens/loading_page.dart';
import './screens/homescreen.dart';
import './screens/intialising_screens/error_page.dart';
import './firebase_authentication/authentication_service.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
        focusColor: Colors.green,
      ),
      darkTheme: ThemeData(
        primaryColor: HexColor("#bb86fc"),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarColor: Colors.black,
        focusColor: HexColor("#bb86fc"),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (err) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  Widget build(BuildContext context) {
    //Error Page if the Firebase Initialising gives an error
    if (_error) {
      return ErrorPage();
    }
    //Loading Screen while the Firebase is initialisating
    if (!_initialized) {
      return LoadingPage();
    }
    //Firebase Initialisation Complete
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
      ],
      child: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AuthenticationService>(builder: (
      context,
      data,
      __,
    ) {
      if (data.user != null) {
        return HomeScreen();
      } else
        return SignIn();
    });
  }
}
