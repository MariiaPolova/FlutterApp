import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.teal[300]),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/list': (context) => Home(),
    },
  ));
}
