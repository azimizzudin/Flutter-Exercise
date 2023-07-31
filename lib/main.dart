import 'package:flutter/material.dart';
import 'package:flutter_exercise/loginPage.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const LoginPage(),
    );
  }
}
