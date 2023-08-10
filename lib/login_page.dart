import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_exercise/services/auth_services.dart';
import 'package:flutter_exercise/widgets/login_text_field.dart';
import 'package:flutter_exercise/utils/spaces.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _url = 'https://flutter.dev';

  final _formkey = GlobalKey<FormState>();

  Future<void> signIn(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      debugPrint('${usernameController.text} ${passwordController.text}');

      await context.read<AuthServices>().loginUser(usernameController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: usernameController.text);

      debugPrint('Sign in succesfully!');
    } else {
      debugPrint('Sign in failed!');
    }
  }

  Widget _buildHeader(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        verticalSpacing(10),
        Container(
            height: 220,
            /* width: MediaQuery.of(context).size.width, */
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        'assets/people-talking-illustration-vector.jpg')),
                borderRadius: BorderRadius.circular(12))),
        verticalSpacing(10),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
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
    );
  }

  Widget _buildForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formkey,
          child: Column(
            children: [
              LoginTextField(
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 5) {
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
                  if (value != null && value.isNotEmpty && value.length < 5) {
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
        verticalSpacing(10),
        ElevatedButton(
            onPressed: () async {
              await signIn(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(15)),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 18),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                LayoutBuilder(builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1000) {
                return Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: [_buildHeader(context), _buildFooter()],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(child: _buildForm(context)),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter()
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
