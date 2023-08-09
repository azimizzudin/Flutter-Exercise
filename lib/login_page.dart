import 'package:flutter/material.dart';
import 'package:flutter_exercise/widgets/login_text_field.dart';
import 'package:flutter_exercise/utils/spaces.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _url = 'https://flutter.dev';

  final _formkey = GlobalKey<FormState>();

  void signIn(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      debugPrint('${usernameController.text} ${passwordController.text}');

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: usernameController.text);

      debugPrint('Sign in succesfully!');
    } else {
      debugPrint('Sign in failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                verticalSpacing(10),
                const Text(
                  'Welcome back! \nYou\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                'assets/people-talking-illustration-vector.jpg')),
                        borderRadius: BorderRadius.circular(12))),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      LoginTextField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Your username should be more than 5 character.';
                          } else if (value != null && value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        controller: usernameController,
                        hintText: 'Username',
                      ),
                      verticalSpacing(10),
                      LoginTextField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Your password should be more than 5 character.';
                          } else if (value != null && value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        hintText: 'Password',
                        hasAsterisks: true,
                      ),
                    ],
                  ),
                ),
                verticalSpacing(15),
                ElevatedButton(
                    onPressed: () {
                      signIn(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.all(15)),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    )),
                verticalSpacing(10),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(_url as Uri)) {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: Column(
                    children: [const Text('Find us on'), Text(_url)],
                  ),
                ),
                verticalSpacing(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(url: 'https://twitter.com'),
                    SocialMediaButton.linkedin(url: 'https://linkedin.com')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
