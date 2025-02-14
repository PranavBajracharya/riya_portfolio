import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:riya_portfolio/screens/flash_chat/components/rounded_button.dart';
import 'package:riya_portfolio/screens/flash_chat/constants.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  // create controllers to handle the values of the textfields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // create a form state global key variable to handle validations
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      
      // wrap the parent most widget with Form widget to check for validations
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    // if you are assigning only height, then use SizedBox instead of Container
                    // SizedBoxes are lighter than Container when it comes to processing so easier to render for the engine
                    height: 200.0,
                    child: Image.asset('images/thunderLogo.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  // assign the controller here
                  // this will assign the values entered in the textfield into the controller
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
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
                const SizedBox(
                  // decimal not necessary if its a 0
                  // do 8 instead of 8.0
                  // enter decimal only if its like 8.5
                  height: 8,
                ),
                TextFormField(
                  // enter password controller here
                  controller: passwordController,
                  obscureText: true,
                  // copyWith means overwriting the default values
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password',
                  ),
                  // do this instead of copyWith
                  // use copyWith only if you know what you are overwriting
                  // decoration: const InputDecoration(
                  //   hintText: "Enter your password",
                  // ),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                RoundedButton(
                  title: 'Log In',
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    if (formKey.currentState!.validate()) {
                      log("ready to login");
                      try {
                        // euta solve vayuo agi ko null wala nonsense
                        // this is how you check for textformfield validations
                        // sign in chalisake thyo haina agi?
                        // eh agi ko register ho? sign up? ohhhhhhhh
                        // nonsense
                        await _auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        // aba treat malai aru thaha chaina
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
                        log(
                          e.toString(),
                          name: "regiLoginster exception",
                          error: e,
                          stackTrace: stackTrace,
                        );
                      }
                    } else {
                      log("validation issues");
                    }

                    // form use garne sabse bahira ko widget lai wrap garne
                    // formkey variable banaune
                    // textEditingControllers banaune ani textFormField maa assign garne
                    // submit button ko onPressed maa validation check garne
                    // yehi ho basic validation ko logic chai
                    // lovely
                    // just lovely
                    // <3
                    // now do the same in registration screen
                    // tespachi i will teach you how to add a show password button
                    // aah huncha sikayena vane ma sikauchu
                    // disconnect garey hai
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
