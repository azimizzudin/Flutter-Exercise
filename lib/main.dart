import 'package:flutter/material.dart';
import 'package:flutter_exercise/chatPage.dart';
import 'package:flutter_exercise/loginPage.dart';
import 'package:flutter_exercise/utils/brandColor.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
          primarySwatch: BrandColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
