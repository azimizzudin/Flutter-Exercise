import 'package:flutter/material.dart';
import 'package:flutter_exercise/chat_page.dart';
import 'package:flutter_exercise/login_page.dart';
import 'package:flutter_exercise/services/auth_services.dart';
import 'package:flutter_exercise/utils/brand_color.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthServices.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AuthServices(), child: ChatApp()));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: BrandColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: FutureBuilder<bool>(
        future: context.read<AuthServices>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!) {
              return ChatPage();
            } else {
              return LoginPage();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: {'/chat': (context) => const ChatPage()},
    );
  }
}
