import 'package:climate_data/components/snack_bar.dart';
import 'package:climate_data/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loading_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: emailTextController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: passwordTextController,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () async {
                  emailTextController.clear();
                  passwordTextController.clear();
                  setState(
                    () {
                      showSpinner = true;
                    },
                  );
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (!mounted) return;
                    Navigator.pushNamed(context, LoadingScreen.id);
                    setState(
                      () {
                        showSpinner = false;
                      },
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      SnackBarService.showSnackBar(
                        context,
                        'No user found for that email.',
                        true,
                      );
                      setState(
                        () {
                          showSpinner = false;
                        },
                      );
                    } else if (e.code == 'wrong-password') {
                      SnackBarService.showSnackBar(
                        context,
                        'Wrong password provided for that user.',
                        true,
                      );
                      setState(
                        () {
                          showSpinner = false;
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
