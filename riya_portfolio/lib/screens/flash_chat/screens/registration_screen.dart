import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:riya_portfolio/screens/flash_chat/components/rounded_button.dart';
import 'package:riya_portfolio/screens/flash_chat/constants.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      // yo kina na gareko
      // wait check garum
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/thunderLogo.jpg'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Email'),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password'),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Register',
                  color: Colors.blueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    // validation check must be performed in the very beginning before other actions take place
                    if (formKey.currentState!.validate()) {
                      // make the api call
                      try {
                        await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        // context.mounted or mounted checks will check if the current BuildContext is still present in the widget tree or not
                        // this is necessary while performing async tasks
                        if (context.mounted) {
                          Navigator.pushNamed(
                            context,
                            ChatScreen.id,
                          );
                        }
                        setState(() {
                          showSpinner = false; 
                        });
                      } catch (e, stackTrace) {
                        // this is done to track the exception more efficiently
                        log(
                          e.toString(),
                          name: "register exception",
                          error: e,
                          stackTrace: stackTrace,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
