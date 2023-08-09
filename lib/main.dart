import 'package:flutter/material.dart';
import 'package:flutter_exercise/chat_page.dart';
import 'package:flutter_exercise/login_page.dart';
import 'package:flutter_exercise/utils/brand_color.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: BrandColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {'/chat': (context) => const ChatPage()},
    );
  }
}
