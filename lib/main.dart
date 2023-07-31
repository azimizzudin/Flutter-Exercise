import 'package:flutter/material.dart';

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

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Button clicked'),
      ),
      body: const Text('Hello World'),
    );
  }
}
